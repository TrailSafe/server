class User < Contact

  has_secure_password

  # Class Methods
  class << self

    def authenticate(phone_number, password)
      self.includes(:secure_password).find_by_phone_number(phone_number).try(:authenticate, password)
    end

  end

  # Associations
  has_one :device
  has_one :secure_password, class_name: 'Password', autosave: true, dependent: :destroy

  # Contact Associations
  has_many :user_emergency_associations, class_name: 'User::EmergencyContact', inverse_of: :user, foreign_key: :user_id
  has_many :emergency_contacts, class_name: 'Contact', through: :user_emergency_associations, inverse_of: :contactable_for_users, source: :contact

  # Callbacks
  before_validation :set_temporary_password, on: :create

  # Validations
  validates_uniqueness_of :phone_number

  # Instance Methods
  def set_temporary_password
    self.password = SecureRandom.base64(6)
    self.password_confirmation = self.password
  end

  def password_digest
    secure_password.try(:digest)
  end

  def password_digest=(val)
    self.secure_password = Password.new(digest: val)
  end

end
