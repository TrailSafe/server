class Api::ApplicationController < ::ApplicationController

  # before_filter :verify_api_key!
  before_filter :verify_device!

  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def info
  end

  def invalid_url
    render json: { error: "Invalid URL" }, status: :not_found
  end

  private

  def current_device
    @current_device ||= Device.find_or_create_by_uuid device_id_header
  end

  def current_user
    @current_user ||= current_device.user
  end

  def record_not_found(error)
    render_error error.message, status: 404
  end

  def verify_api_key!
    unless ENV['API_KEY'].present? && authorization_header == ENV['API_KEY']
      render_error 'Invalid API key', status: 401
    end
  end

  def verify_device!
    if current_device.errors.present?
      message = [:device, current_device.errors.full_messages.to_sentence.downcase].join(' ')
      render_error message
    end
  end

  def render_error(message, status: 400)
    @error_message = message
    render :error, status: status
  end

  def authorization_header
    request.headers['HTTP_AUTHORIZATION']
  end

  def device_id_header
    request.headers['HTTP_DEVICE_ID']
  end

  helper_method :current_device

end