class Api::ActivitiesController < Api::ApplicationController

  before_filter :find_activity, only: [:show, :update, :destroy]

  def index
    @activities = current_user.activities
  end

  def create
    if (@activity = current_device.activities.create(activity_params))
      render :show, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @activity.update_attributes(activity_params)
      render :show
    else
      head :unprocessable_entity
    end
  end

  def destroy
    if @activity.destroy
      head :ok
    else
      head 400
    end
  end

  private

  def find_activity
    @activity = current_device.activities.find params.delete :id
  end

  def activity_params
    params.require(:activity).permit(:name, :activity_area_data, :return_area_data, :duration)
  end

end
