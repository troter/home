# -*- mode: ruby -*-

namespace :mercurial do
  namespace :extensions do
    extensions_dir = "~/.mercurial/extensions".gsub(/~/, ENV['HOME'])
    extensions = [
      %w[https://bitbucket.org/troter/hg-grepfile hg-grepfile],
      %w[https://bitbucket.org/durin42/hg-git hg-git],
      %w[https://bitbucket.org/sjl/hg-review hg-review],
      %w[https://bitbucket.org/peerst/hgcollapse hgcollapse],
      %w[https://bitbucket.org/yujiewu/hgflow hgflow],
      %w[https://bitbucket.org/durin42/hgsubversion/ hgsubversion],
      %w[https://bitbucket.org/alu/hgtasks hgtasks],
    ]
    extension_dirs = extensions.map do |extension|
      _, name = extension
      File.join(extensions_dir, name)
    end

    directory extensions_dir
    extensions.each do |extension|
      url, name = extension
      file File.join(extensions_dir, name) => extensions_dir do
        cd extensions_dir do
          sh "hg clone #{url} #{name}"
        end
      end
    end

    desc "mercurial extensions install"
    task :install => extension_dirs

    desc "mercurial extensions update"
    task :update do
      extension_dirs.each do |extension_dir|
        if File.exists? extension_dir
          cd extension_dir do
            sh "hg update"
          end
        end
      end
    end
  end
end
