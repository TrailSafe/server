class Api::UsersController < ApplicationController

  def create
    @user = User.new user_params
    if @user.save
      render :show
    else
      render_error
    end
  end

  def show

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number)
  end

end
