module Jasmine
  module Runner
    class ReportersController < ApplicationController

      before_filter :prepare_config

      def index
      end

      def teamcity
      end

      private

      def prepare_config
        @config = Jasmine::Runner.config
      end

    end
  end
end