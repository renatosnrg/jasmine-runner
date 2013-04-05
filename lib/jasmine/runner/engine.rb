module Jasmine
  module Runner
    class Engine < Rails::Engine

      isolate_namespace Jasmine::Runner

      # Add Jasmine Core dir and specs dir to the assets paths,
      # so the files can be relative to "/assets/" path
      initializer :assets, :group => :all do |app|
        app.config.assets.paths << Jasmine::Runner.config.core_dir
        app.config.assets.paths << Jasmine::Runner.config.spec_dir
      end

      # Mount the engine into the application
      config.after_initialize do |app|
        app.routes.prepend do
          mount Jasmine::Runner::Engine => Jasmine::Runner.config.mount_at
        end if Jasmine::Runner.config.mount
      end

    end
  end
end