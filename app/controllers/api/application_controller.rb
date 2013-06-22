class Api::ApplicationController < ::ApplicationController

  before_filter :verify_api_key!, except: :invalid_url
  before_filter :verify_device!, except: :invalid_url

  respond_to :json
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def invalid_url
    render_error message: 'Invalid URL', status: :not_found
  end

  private

  def authorization_header
    request.headers['HTTP_AUTHORIZATION']
  end

  def current_device
    @current_device ||= Device.find_or_create_by_uuid device_uuid_header
  end

  def current_user
    @current_user ||= current_device.user
  end

  def device_uuid_header
    request.headers['HTTP_DEVICE_ID']
  end

  def record_not_found(error)
    render_error message: error.message, status: 404
  end

  def render_error(message: 'There was an error', status: 400)
    @error_message = message
    render :error, status: status
  end

  def verify_api_key!
    unless ENV['API_KEY'].present? && authorization_header == ENV['API_KEY']
      render_error message: 'Invalid API key', status: 401
    end
  end

  def verify_device!
    if current_device.errors.present?
      message = [:device, current_device.errors.full_messages.to_sentence.downcase].join(' ')
      render_error message: message
    end
  end

  helper_method :current_device

end