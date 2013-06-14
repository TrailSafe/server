Server::Application.routes.draw do
  scope module: :api, constraints: { subdomain: 'api' }, as: :api do
    root to: 'application#info'
    scope 'devices/:device_uuid/' do

      # Current Items
      resource :current_activity, only: [:show, :destroy] do
        resources :locations, only: [:create]
      end
      resource :current_help_request, only: [:create, :destroy, :show] do
        resources :locations, only: [:create]
      end

      # User Resources
      resource :user do
        resource :emergency_contact, controller: :contacts, only: [:create, :show, :update, :destroy]
        resources :activities, only: [:create, :show, :update, :destroy, :index]
      end

    end
  end
end
