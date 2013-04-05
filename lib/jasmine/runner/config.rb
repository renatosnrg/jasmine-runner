require 'yaml'

module Jasmine
  module Runner
    class Config

      attr_accessor :mount
      attr_accessor :mount_at
      attr_accessor :phantom_path
      attr_accessor :port
      attr_accessor :js_files
      attr_accessor :css_files
      attr_accessor :spec_files
      attr_accessor :src_files
      attr_accessor :spec_dir
      attr_accessor :core_dir
      attr_accessor :src_dir

      def initialize
        @mount = true
        @mount_at = 'jasmine'
        @phantom_path = 'phantomjs' # considered in PATH
      end

      # Server port.
      def port
        @port ||= jasmine_config.port
      end

      # Paths for the Jasmine core Javascript files to be included automatically in the reports.
      # Paths should be relative to core_dir.
      def js_files
        @js_files ||= Jasmine::Core.js_files
      end

      # Paths for the Jasmine core CSS files to be included automatically in the reports.
      # Paths should be relative to core_dir.
      def css_files
        @css_files ||= Jasmine::Core.css_files
      end

      # Paths for the spec files (tests) to be included automatically in the reports.
      # Paths should be relative to src_dir.
      def spec_files
        @spec_files ||= get_js_files(spec_dir)
      end

      # Paths for the Javascript source code to be tested to be included automatically in the reports
      # Paths should be relative to spec_dir.
      def src_files
        @src_files ||= jasmine_yaml_config['src_files']
      end

      # Dir path where the specs can be found.
      # This path is added to the Rails assets paths in the initializer.
      def spec_dir
        # @spec_dir ||= File.join(src_dir, 'spec', 'javascripts')
        @spec_dir ||= jasmine_config.spec_dir
      end

      # Dir path where the Jasmine core files can be found.
      # This path is added to the Rails assets paths in the initializer.
      def core_dir
        @core_dir ||= Jasmine::Core.path
      end

      # Project path.
      def src_dir
        @src_dir ||= Rails.root
      end

      private

      def get_js_files(dir)
        Dir.glob("#{dir}/**/*.js").collect do |path|
          path.gsub!(/#{dir}\//, '')
        end
      end

      def load_configuration_from_yaml
        filepath = File.join(spec_dir, 'support', 'jasmine.yml')
        YAML.load_file(filepath) if File.exist?(filepath)
      end

      def jasmine_yaml_config
        @jasmine_yaml_config ||= load_configuration_from_yaml
      end

      def jasmine_config
        @jasmine_config ||= Jasmine.load_configuration_from_yaml && Jasmine.config
      end

    end
  end
end