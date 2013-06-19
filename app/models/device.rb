class Device < ActiveRecord::Base

  # Scopes
  scope :verified, ->{ where 'verified_on IS NOT NULL' }

  # Attributes
  attr_readonly :uuid

  # Associations
  belongs_to :user

  # Validations
  validates :uuid,
            presence: true,
            uniqueness: true,
            format: {
              with: /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i,
              message: 'is not a properly formatted uuid',
              allow_nil: true
            }

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
