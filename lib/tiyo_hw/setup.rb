require "fileutils"
require "uri"
module TiyoHw
  class Setup
    attr_accessor :url
    def initialize(url)
      @url = url
    end

    def sha
      matches = /\b[0-9a-f]{5,40}\b/.match(url)
      matches.to_s if matches && !gist?
    end

    def git_url
      final_url = url.split("/tree/").first
      "#{final_url}#{'.git' unless final_url.end_with?('.git')}"
    end

    def gist?
      /gist\.github\.com/.match(url)
    end

    def dir_name
      git_url.split(%r{[\/\.]})[-3..-2].join("-")
    end

    def clean_dir
      FileUtils.rm_rf(File.join(homework_path, dir_name))
    end

    def homework_path
      File.expand_path(HOMEWORK_DIR)
    end

    def setup
      FileUtils.mkdir_p homework_path
    end

    def cmd
      setup
      clean_dir
      cmds = []
      cmds << "cd #{homework_path}"
      cmds << "git clone #{git_url} #{dir_name}"
      cmds << "cd #{dir_name}"
      cmds << "git checkout #{sha} -b submitted_assignment" if sha
      cmds << "#{EDITOR} ."
      cmds.join(" && ")
    end
  end
end
