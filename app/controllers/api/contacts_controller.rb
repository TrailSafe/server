class Api::ContactsController < Api::ApplicationController
  before_filter :find_contact, only: [:show, :update, :destroy]
  class MissingContact < StandardError ; end
  rescue_from MissingContact, with: :record_not_found

  def create
    @contact = Contact.new(contact_params)
    if @contact.update_attributes(emergency_contact_for: current_user)
      render :show, status: :created
    else
      head :unprocessable_entity
    end
  end

  def show
  end

  def update
    if @contact.update_attributes(activity_params)
      render :show
    else
      head :unprocessable_entity
    end
  end

  def destroy
    head :ok if @contact.destroy
  end

  private

  def find_contact
    unless (@contact = current_user.emergency_contact)
      raise MissingContact, 'User does not have an emergency contact.'
    end
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number)
  end

end
