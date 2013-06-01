class User < Contact

  default_scope ->{ order(:updated_at) }

  has_one :device
  has_one :user_contact
  has_one :emergency_contact, class_name: 'Contact', through: :user_contact, source: :contact
  has_many :activities
end
