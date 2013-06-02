Server::Application.routes.draw do
  constraints subdomain: 'api' do
    scope module: :api do
      scope 'devices/:device_uuid/' do
        resource :user do
          resource :emergency_contact, controller: :contacts, only: [:create, :show, :update, :destroy]
          resources :activities, only: [:create, :show, :update, :destroy, :index]
        end
        resources :help_requests, only: [:create, :show]
        resources :locations, only: [:create]
      end
    end
  end

  constraints subdomain: 'www' do
    root to: 'pages#home'

    get 'about' => 'pages#about'
    get 'contact' => 'pages#contact'

    resources :help_requests
  end

  # Root not matched domain roots to www
  get '/' => 'application#redirect_to_www'

end
