class Api::CurrentActivitiesController < Api::ApplicationController

  def show
    @activity = current_device.activities.incomplete.last!
    render 'api/activities/show'
  end

  def destroy
    if current_device.activities.incomplete.last!.delete
      head :ok
    else
      head 400
    end
  end

end
