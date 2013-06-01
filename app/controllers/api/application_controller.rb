class Api::ApplicationController < ApplicationController

  respond_to :json

  private

  def current_device
    Device.find(params[:device_uuid])
  end

end
