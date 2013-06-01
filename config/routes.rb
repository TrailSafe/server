Server::Application.routes.draw do

  constraints subdomain: 'api' do
    scope 'devices/:device_uuid/' do
      resource :user do
        resources :contacts, only: [:create, :show, :update, :destroy, :index]
        resources :activities, only: [:create, :show, :update, :destroy, :index]
        resources :help_requests, only: [:create, :show]
        resources :locations, only: [:create]
      end
    end
  end

  constraints subdomain: 'www' do

  end

  # Root not matched domain roots to www
  root to: 'application#direct_to_www'

end
