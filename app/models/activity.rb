class Activity < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  belongs_to :device
  belongs_to :user

  has_one :emergency_contact, class_name: 'Contact', through: :user

  has_one :activity_area, as: :locatable, class_name: 'Location'
  has_one :return_area, as: :locatable, class_name: 'Location'

  after_create :set_user_from_device

  private

  def set_user_from_device
    self.user = device.user
  end

end
