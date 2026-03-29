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

class StatusLine
  def initialize(input)
    @cwd_full   = input.dig("workspace", "current_dir") || input["cwd"] || ""
    @cwd        = @cwd_full.sub(%r{\A#{Regexp.escape(ENV["HOME"])}}, "~")
    @model      = input.dig("model", "display_name") || ""
    @version    = input["version"] || ""
    @used       = input.dig("context_window", "used_percentage")
    @cost_raw   = input.dig("cost", "total_cost_usd")
    @five_hour  = input.dig("rate_limits", "five_hour")
    @seven_day  = input.dig("rate_limits", "seven_day")
  end

  def to_s
    lines = [
      [location],
      [@model, context, rate_limits, cost, "v#{@version}"],
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

  COLOR_GREEN  = "\033[32m"
  COLOR_YELLOW = "\033[33m"
  COLOR_RED    = "\033[31m"
  COLOR_RESET  = "\033[0m"

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
