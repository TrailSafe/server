class Device < ActiveRecord::Base

  # Scopes
  scope :verified, ->{ where 'verified_on IS NOT NULL' }

  # Attributes
  attr_readonly :uuid

  # Associations
  belongs_to :user

  # Validations
  validates :uuid, presence: true, uniqueness: true

  # Callbacks
  after_create :send_verification_text

  # Instance Methods
  def verify!
    self.verified_on ||= Time.now
  end

  def verified?
    self.verified_on.present?
  end

  private

  def send_verification_text
    # does nothing yet!
  end

end
