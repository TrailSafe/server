Server::Application.routes.draw do
  scope constraints: { domain: 'trl.io' }, as: :short do
    root to: 'application#redirect_to_www'
    get '/:id' => 'help_requests#show'
  end
end