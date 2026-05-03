#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "open3"

class GitCommand
  ENV_OPTS = { "GIT_OPTIONAL_LOCKS" => "0" }.freeze

  def initialize(dir)
    @dir = dir
  end

  def resolve_branch
    return nil unless run("rev-parse", "--git-dir")

    branch = run("symbolic-ref", "--short", "HEAD")
    branch = run("rev-parse", "--short", "HEAD") if branch.nil? || branch.empty?
    branch&.empty? ? nil : branch
  end

  private

  def run(*args)
    out, status = Open3.capture2(ENV_OPTS, "git", "-C", @dir, *args, err: File::NULL)
    status.success? ? out.chomp : nil
  end
end

class ClaudeStatus
  CACHE_DIR = File.join(ENV["HOME"], ".claude", "scripts", "cache")

  def self.org_name
    FileCache.fetch(File.join(CACHE_DIR, "auth.json")) {
      out, status = Open3.capture2("claude", "auth", "status", err: File::NULL)
      status.success? ? out : nil
    }&.dig("orgName")
  end

  class FileCache
    TTL = 3600 # 1 hour

    def self.fetch(path, ttl: TTL)
      data = read(path, ttl: ttl)
      return data if data

      raw = yield
      return nil if raw.nil?

      write(path, raw)
    end

    class << self
      private

      def read(path, ttl:)
        return nil unless File.exist?(path)
        return nil if Time.now - File.mtime(path) > ttl

        JSON.parse(File.read(path))
      rescue JSON::ParserError
        nil
      end

      def write(path, raw)
        Dir.mkdir(File.dirname(path)) unless Dir.exist?(File.dirname(path))
        File.write(path, raw)
        JSON.parse(raw)
      rescue JSON::ParserError
        nil
      end
    end
  end
end

class StatusLine
  # モデル別のデフォルト effort level
  # 出典: https://code.claude.com/docs/en/model-config#adjust-effort-level
  # ドキュメントが更新されたらこの表も更新する
  MODEL_DEFAULT_EFFORT = {
    "claude-opus-4-7"   => "xhigh",
    "claude-opus-4-6"   => "high",
    "claude-sonnet-4-6" => "high",
  }.freeze

  def initialize(input)
    @cwd_full     = input.dig("workspace", "current_dir") || input["cwd"] || ""
    @cwd          = @cwd_full.sub(%r{\A#{Regexp.escape(ENV["HOME"])}}, "~")
    @model        = input.dig("model", "display_name") || ""
    @model_id     = input.dig("model", "id") || ""
    @version      = input["version"] || ""
    @used         = input.dig("context_window", "used_percentage")
    @cost_raw     = input.dig("cost", "total_cost_usd")
    @five_hour    = input.dig("rate_limits", "five_hour")
    @seven_day    = input.dig("rate_limits", "seven_day")
    @effort       = input.dig("effort", "level")
    @output_style = input.dig("output_style", "name")
    @org_name     = ClaudeStatus.org_name
  end

  def to_s
    lines = [
      [output_style, location],
      [model_label, context, rate_limits, cost, "v#{@version}", @org_name],
    ]

    lines.map { |line| line.compact.join(" | ") }.join("\n")
  end

  alias statusline to_s

  private

  def location
    branch = GitCommand.new(@cwd_full).resolve_branch
    suffix = branch ? " [#{branch}]" : ""
    "#{@cwd}#{suffix}"
  end

  def context
    @used ? "ctx:#{colorize_pct(@used.to_i)}" : "ctx:--%"
  end

  def model_label
    parts = [@model]
    parts << @effort if show_effort?
    parts.join(" ")
  end

  def show_effort?
    !@effort.nil? && @effort != default_effort
  end

  def default_effort
    base_id = @model_id.sub(/\[\d+[a-z]\]\z/, "")
    MODEL_DEFAULT_EFFORT[base_id]
  end

  def output_style
    return nil unless show_style?

    "#{COLOR_MAGENTA}*#{@output_style}*#{COLOR_RESET}"
  end

  def show_style?
    !@output_style.nil? && !@output_style.casecmp?("default")
  end

  def rate_limits
    parts = [
      format_rate("5h", @five_hour) { |d| format_remaining(d["resets_at"]) },
      format_rate("7d", @seven_day) { |d| format_resets_at(d["resets_at"]) },
    ].compact

    parts.empty? ? nil : parts.join(" ")
  end

  def cost
    @cost_raw ? "$#{"%.2f" % @cost_raw}" : "$--"
  end

  def format_rate(label, data)
    return nil unless data && data["used_percentage"]

    pct_i = data["used_percentage"].to_i
    detail = block_given? ? yield(data) : nil
    suffix = detail ? "(#{detail})" : ""
    "#{label}:#{colorize_pct(pct_i)}#{suffix}"
  end

  def format_remaining(resets_at)
    return nil unless resets_at

    diff = resets_at - Time.now.to_i
    return "0m" if diff <= 0

    hours, rest = diff.divmod(3600)
    mins = rest / 60

    hours > 0 ? "#{hours}h#{mins}m" : "#{mins}m"
  end

  WEEKDAYS = %w[日 月 火 水 木 金 土].freeze

  def format_resets_at(resets_at)
    return nil unless resets_at

    t = Time.at(resets_at).getlocal
    "#{WEEKDAYS[t.wday]}%02d:%02d" % [t.hour, t.min]
  end

  COLOR_GREEN   = "\033[32m"
  COLOR_YELLOW  = "\033[33m"
  COLOR_RED     = "\033[31m"
  COLOR_MAGENTA = "\033[35m"
  COLOR_RESET   = "\033[0m"

  def color_for_pct(pct_i)
    case pct_i
    when 0..33  then COLOR_GREEN
    when 34..66 then COLOR_YELLOW
    else             COLOR_RED
    end
  end

  def colorize_pct(pct_i)
    "#{color_for_pct(pct_i)}%02d%%#{COLOR_RESET}" % pct_i
  end
end

print StatusLine.new(JSON.parse($stdin.read)).statusline
