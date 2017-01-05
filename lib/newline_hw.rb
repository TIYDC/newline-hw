require_relative "newline_hw/version"
require_relative "newline_hw/shell/run"
require_relative "newline_hw/shell/setup"
require_relative "newline_hw/shell/function"
require_relative "newline_hw/chrome_manifest"
require_relative "newline_hw/gui_trigger"
require_relative "newline_hw/stream_command_handler"
require_relative "newline_hw/stream_processor"
require "active_support/core_ext/string"

module NewlineHw
  SLEEP_TIME = 4
  HOMEWORK_DIR = "~/theironyard/homework".freeze

  module_function

  def logfile
    File.expand_path "~/Library/Logs/newline_hw/newlinehw.log"
  end

  def editor
    "atom".freeze
  end

  def make_log_directory
    return if Dir.exist?(File.dirname(NewlineHw.logfile))
    Dir.mkdir(File.dirname(NewlineHw.logfile))
  end
end
