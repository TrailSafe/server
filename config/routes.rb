require_relative 'routes/api'
require_relative 'routes/short'

# Default Routes File
Server::Application.routes.draw do
  root to: 'pages#home'
  get ':page' => 'pages#show'
  resources :help_requests
end
