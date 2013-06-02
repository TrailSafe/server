class Api::HelpRequestsController < Api::ApplicationController

  before_filter :find_help_request, only: [:destroy, :show]

  def create
    if (@help_request = current_device.help_requests.create)
      render :show, status: :created
    else
      head 422
    end
  end

  def show
  end

  def destroy
    if @help_request.destroy
      head :ok
    else
      head 400
    end
  end

  private

  def find_help_request
    @help_request = current_device.help_requests.find params.delete(:id)
  end

end
