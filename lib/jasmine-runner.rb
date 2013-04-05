require "jasmine/runner/version"
require "jasmine/runner/engine"
require "jasmine/runner/server"
require "jasmine/runner/config"
require "jasmine/runner/phantom"

module Jasmine
  module Runner
    mattr_accessor :config
    @@config = Config.new

    # Enable to change configurations using some initializer
    def self.setup
      yield self.config
    end
  end
end
