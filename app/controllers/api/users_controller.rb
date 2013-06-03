class Api::UsersController < Api::ApplicationController

  def create
    @user = User.new user_params
    @user.device = current_device
    if @user.save
      render :show, status: :created
    else
      head :unprocessable_entity
    end
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
    params.require(:user).permit(:first_name, :last_name, :phone_number)
  end
end
