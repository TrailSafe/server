class Api::ContactsController < ApplicationController
  before_filter :find_contact, on: [:show, :update, :destroy]

  def index
    @contacts = current_device.contacts
  end

  def create
    if (@contact = current_device.contacts.create(activity_params))
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
    @contact = current_device.contacts.find params.delete :id
  end

  def activity_params
    params.permit(:first_name, :last_name, :phone_number)
  end

end
