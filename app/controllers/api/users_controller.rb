class Api::UsersController < Api::ApplicationController

  def create
    @user = current_device.create_user(user_params)
    render :show, status: :create
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes user_params
  end

  private

  def user_params
    params[:user].permit(:first_name, :last_name, :phone_number)
  end
end
