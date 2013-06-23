class Contact < ActiveRecord::Base
  include FormattedErrors

  has_many :contact_emergency_associations, class_name: 'User::EmergencyContact', inverse_of: :contact, foreign_key: :contact_id
  has_many :contactable_for_users, class_name: 'User', through: :contact_emergency_associations, inverse_of: :emergency_contacts, source: :user

  validates_presence_of :first_name, :last_name
  validates :phone_number, presence: true
end
