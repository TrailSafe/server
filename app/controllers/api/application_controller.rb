class Api::ApplicationController < ::ApplicationController

  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def current_device
    Device.find_or_create_by(id: params[:device_uuid])
  end

  def current_user
    User.find(current_device.user_id)
  end

  def record_not_found(error)
    render json: { error: error.message }, status: 404
  end

end
