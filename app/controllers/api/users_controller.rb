class Api::UsersController < ApplicationController

  def create
    @user = current_device.create_user(user_params)
  end

  def show
    @user = current_device.user
  end

  def update
    @user = current_device.user
    @user.update_attributes user_params
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :phone_number)
  end
end
