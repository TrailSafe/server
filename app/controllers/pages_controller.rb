class PagesController < ApplicationController

  def home
    render :home, layout: 'application'
  end

  def show
    if page_exists?
      render params[:page]
    else
      render :not_found, layout: 'application', status: :not_found
    end
  end

  private

  def page
    params[:page]
  end

  def page_exists?
    lookup_context.find_all([:pages, page].join('/')).any?
  end


end
