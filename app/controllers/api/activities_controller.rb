class Api::ActivitiesController < ApplicationController

  before_filter :find_activity, on: [:show, :update, :destroy]

  def index
    @activities = current_device.activities
  end

  def create
    if (@activity = current_device.contacts.create(activity_params))
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
    head :ok if @activity.destroy
  end

  private

  def find_activity
    @activity = current_device.activities.find params.delete :id
  end

  def activity_params
    params.permit(:name, :start_area_data, :return_area_data, :duration)
  end

end
