class Device < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  belongs_to :user
  has_one :emergency_contact, through: :user
  has_one :help_request, dependent: :restrict_with_exception
  has_many :activities
  has_many :locations, as: :locatable
  has_many :help_requests

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
