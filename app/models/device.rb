class Device < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }
  delegate :emergency_contact, to: :user

  belongs_to :user
  has_one :help_request, dependent: :destroy
  has_many :activities
  has_many :locations, as: :locatable

  def current_activity
    incomplete_activities.last
  end

  def current_activity!
    incomplete_activities.last!
  end

  private

  def incomplete_activities
    activities.incomplete
  end

end
