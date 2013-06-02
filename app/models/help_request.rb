class HelpRequest < ActiveRecord::Base
  delegate :emergency_contact, :current_activity, to: :device

  scope :not_user_initiated, ->{ where(user_initiated: [nil, false]) }
  scope :by_alerted, ->(name){ where() }

  belongs_to :device
  has_one :user, through: :device

  before_create :generate_short_url!
  after_create :alert_all!, if: :user_initiated

  validates_presence_of :device

  def been_rescued!
    update_attributes rescued_at: Time.now
  end

  def alert!(alertable)
    self.alerts ||= {}
    if alerter_class(alertable).new(self).invoke!
      self.alerts[alertable] = Time.now
      save
    end
  end

  def alert_all!
    [:emergency_contact].each { |name| alert! name }
  end

  private

  def alerter_class(alertable)
    [alertable.to_s, 'alerter'].join('_').classify.constantize
  end

  def generate_short_url!
    generated      = SecureRandom.hex 5
    self.short_url = self.class.where(short_url: generated).exists? ? generate_short_url! : generated
  end

end
