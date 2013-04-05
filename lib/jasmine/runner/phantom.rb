module Jasmine
  module Runner
    class Phantom

      attr_reader :phantom_path

      def initialize
        @phantom_path = Jasmine::Runner.config.phantom_path
      end

      def command(server_url)
        command = []
        command << phantom_path
        command << path
        command << server_url
        command.join(' ')
      end

      def path
        File.join File.dirname(__FILE__), 'phantom', 'jasmine_runner.js'
      end

    end
  end
end