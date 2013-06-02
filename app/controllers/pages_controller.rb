class PagesController < ApplicationController
  def home
  end

  def about
    render layout: 'layouts/content_page'
  end

  def contact
    render layout: 'layouts/content_page'
  end
end
