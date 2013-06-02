class Api::LocationsController < Api::ApplicationController
  def create
    if current_device.locations.create data: location_params
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def location_params
    params.require(:location).require(:data).permit!
  end
end
