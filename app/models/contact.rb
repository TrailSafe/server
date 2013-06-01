class Contact < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  has_one :user_contact
  has_one :emergency_contact_for, class_name: 'User', through: :user_contact, source: :user
end
