class Api::HelpRequestsController < ApplicationController
  def create
    if (@help_request = current_device.help_requests.create)
      render :show, status: :created
    else
      head 422
    end
  end

  def show
    @help_request = current_device.help_requests.find params.delete(:id)
  end
end
