Server::Application.routes.draw do
  scope module: :api, constraints: { subdomain: 'api' }, as: :api do
    root to: 'application#info'
    scope 'devices/:device_uuid/' do
      resource :current_activity, only: [:show, :destroy]
      resource :user do
        resource :emergency_contact, controller: :contacts, only: [:create, :show, :update, :destroy]
        resources :activities, only: [:create, :show, :update, :destroy, :index]
      end
      resource :help_request, only: [:create, :destroy, :show]
      resources :locations, only: [:create]
    end
  end
end
