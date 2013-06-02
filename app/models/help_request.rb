class HelpRequest < ActiveRecord::Base
  delegate :current_activity, to: :device

  belongs_to :device
  has_one :user, through: :device
  has_one :emergency_contact, through: :device

  before_create :generate_short_url!
  after_create ->{ alert! :user }

  def been_rescued!
    update_attributes rescued_at: Time.now
  end

  def alert!(alertable)
    alerter_class(alertable).new(self).invoke!
  end

  private

  def alerter_class(alertable)
    [alertable.to_s, 'alerter'].join('_').classify.constantize
  end

  def generate_short_url!
    generated = SecureRandom.hex 5
    self.short_url = self.class.where(short_url: generated).exists? ? generate_short_url! : generated
  end

end
