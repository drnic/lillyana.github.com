require 'cucumber/formatter/unicode' # Comment out this line if you don't want Cucumber Unicode support
require "fileutils"
Before do
  ROOT = File.expand_path(File.dirname(__FILE__) + "/../..")
end