Server::Application.routes.draw do
# Api Routes
  scope module: :api, constraints: { subdomain: 'api' }, as: :api, defaults: { format: :json } do
    root to: 'application#info'
    # Current Items
    resource :current_activity, controller: :activities, only: [:create, :show, :destroy] do
      resources :locations, only: [:create]
    end
    resource :current_help_request, controller: :help_requests, only: [:create, :destroy, :show] do
      resources :locations, only: [:create]
    end

    # User Resources
    resource :user do
      resource :emergency_contact, controller: :contacts, only: [:create, :show, :update, :destroy]
      resources :activities, only: [:create, :show, :update, :destroy, :index]
    end
    get '/*path' => 'application#invalid_url'
  end

# Short Url Routes
  Server::Application.routes.draw do
    scope constraints: { domain: 'trl.io' }, as: :short do
      root to: 'application#redirect_to_www'
      get '/:id' => 'help_requests#show'
    end
  end

# Default Routes File
  root to: 'pages#home'
  get ':page' => 'pages#show'
  resources :help_requests
end
