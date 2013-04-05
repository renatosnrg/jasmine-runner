module Jasmine
  module Runner
    class Server
      attr_reader :port

      def initialize
        @port = Jasmine::Runner.config.port
      end

      # Inits the own Rails application on the configured port
      def start
        server = Jasmine::Server.new(port, Rails.application.to_app)

        t = Thread.new do
          server.start
        end
        t.abort_on_exception = true

        Jasmine::wait_for_listener(port, "jasmine server")
      end

    end
  end
end