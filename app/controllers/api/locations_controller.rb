class Api::LocationsController < ApplicationController
  def create
    if current_device.locations.create location_params
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def location_params
    params.permit(:data)
  end
end
