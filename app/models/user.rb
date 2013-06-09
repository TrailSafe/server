class User < Contact

  has_many :devices
  has_many :activities
  has_many :user_contacts
  has_many :emergency_contacts, class_name: 'Contact', through: :user_contacts, source: :contact

end
