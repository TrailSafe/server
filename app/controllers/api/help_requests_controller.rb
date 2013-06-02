class Api::HelpRequestsController < Api::ApplicationController

  before_filter :find_help_request, only: [:destroy, :show]

  def create
    if (@help_request = current_device.create_help_request user_initiated: true)
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
    unless (@help_request = current_device.help_request)
      render json: { error: 'Help request not found' }, status: :not_found
    end
  end

end
