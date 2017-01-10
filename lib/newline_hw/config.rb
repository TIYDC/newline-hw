require "yaml"

module NewlineHw
  class Config
    CONFIG_PATH = File.expand_path("~/.newline_hw.yaml").freeze
    DEFAULTS = {
      "editor" => "atom",
      "terminal" => "Terminal",
      "launch_editor" => true,
      "homework_dir" => "~/theironyard/homework",
      "log_file" => "~/Library/Logs/newline_hw/newlinehw.log"
    }.freeze

    def update(options)
      @config = config.merge(options)
    end

    def config
      @config ||= DEFAULTS.merge(config_file)
    end

    def config_file
      YAML.load_file(CONFIG_PATH) || DEFAULTS
    rescue Errno::ENOENT
      DEFAULTS
    end

    def editor
      config["editor"]
    end

    def terminal
      config["terminal"]
    end

    def log_file
      config["log_file"]
    end

    def homework_dir
      config["homework_dir"]
    end

    def launch_editor
      config["launch_editor"]
    end

    def self.install_default
      File.open(CONFIG_PATH, "w+") do |f|
        f.write DEFAULTS.to_yaml
      end
    end
  end
end
