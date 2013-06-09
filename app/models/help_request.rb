class HelpRequest < ActiveRecord::Base

  # Scopes
  scope :with_devices, -> { includes(:device) }
  scope :with_alerts, -> { includes(:alerts) }
  scope :invoked_by, ->(type) { where(invoked_by_type: type) }

  # Associations
  belongs_to :device
  belongs_to :invoked_by, polymorphic: true
  has_one :user, through: :device
  has_many :alerts

  # Callbacks
  before_create :generate_key!
  after_create :alert_all!, if: ->{ invoked_by.instance_of? User }

  # Validations
  validates_presence_of :device, :invoked_by

  # Attributes
  delegate :emergency_contacts, :current_activity, to: :device

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

  def generate_key!
    generated = SecureRandom.hex 5
    self.key  = self.class.where(short_url: generated).exists? ? generate_short_url! : generated
  end

end
