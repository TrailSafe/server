class User < Contact
  has_one :device
  has_one :user_contact
  has_one :emergency_contact, class_name: 'Contact', through: :user_contact
end
