class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def redirect_to_www
    redirect_to :root, subdomain: 'www'
  end

end
