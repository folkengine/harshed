require 'fileutils'
require 'yamlable'
require 'harshed/harsh'
require 'harshed/version'

# Ruby Serializable Hashed Array Utility
module Harshed
  def self.default_base_folder
    File.join(File.dirname(__FILE__), '..', 'data')
  end
end
