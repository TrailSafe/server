class Api::CurrentActivitiesController < Api::ApplicationController

  def show
    @activity = current_device.current_activity!
    render 'api/activities/show'
  end

  def destroy
    if current_device.current_activity!.delete
      head :ok
    else
      head 400
    end
  end

end
