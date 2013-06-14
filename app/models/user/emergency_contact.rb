class User::EmergencyContact < ActiveRecord::Base
  self.table_name = 'user_emergency_contacts'

  belongs_to :user, inverse_of: :user_emergency_associations, class_name: 'User'
  belongs_to :contact, inverse_of: :contact_emergency_associations, class_name: 'Contact'
end
