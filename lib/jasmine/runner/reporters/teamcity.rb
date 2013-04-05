module Jasmine
  module Runner
    module Reporters
      class Teamcity

        delegate :start, :port, :to => :@server

        def initialize
          @server = Jasmine::Runner::Server.new
          @phantom = Jasmine::Runner::Phantom.new
        end

        def url
          "http://localhost:#{port}/jasmine/reporters/teamcity"
        end

        def command
          @phantom.command(url)
        end

      end
    end
  end
end