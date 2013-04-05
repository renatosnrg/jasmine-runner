Jasmine::Runner::Engine.routes.draw do
  resources :reporters, :only => [:index] do
    collection do
      get 'teamcity'
    end
  end
  root :to => "reporters#index"
end
