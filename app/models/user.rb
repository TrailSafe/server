class User < Contact
  has_many :user_emergency_associations, class_name: 'User::EmergencyContact', inverse_of: :user, foreign_key: :user_id
  has_many :emergency_contacts, class_name: 'Contact', through: :user_emergency_associations, inverse_of: :contactable_for_users, source: :contact
end
