class Api::ApplicationController < ::ApplicationController

  before_filter :verify_api_key!

  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def info
    render json: { info: 'v1 of the TrailSafe API' }
  end

  private

  def current_device
    @current_device ||= Device.find_or_create_by(id: params[:device_uuid])
  end

  def current_user
    @current_user ||= User.find(current_device.user_id)
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def verify_api_key!
    unless ENV['API_KEY'].present? && authorization_header == ENV['API_KEY']
      render json: { error: 'Invalid API key' }, status: 401
    end
  end

  def authorization_header
    request.headers['HTTP_AUTHORIZATION']
  end

end
