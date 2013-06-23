class Api::UsersController < Api::ApplicationController

  before_filter :verify_current_user!, :load_user, except: :create

  def create
    @user = User.new user_params
    if @user.save
      render :show
    else
      render_error @user.errors_to_sentence, :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @user.update_attributes user_params
      render :show
    else
      render_error message: @user.errors_to_sentence, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render_message message: "Successfully deleted User #{@user.id}"
    else
      render_error message: "Unable to delete User #{@user.id}"
    end
  end

  private

  def load_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number).merge device: current_device
  end

end
