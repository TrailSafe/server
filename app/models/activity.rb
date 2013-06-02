class Activity < ActiveRecord::Base

  attr_reader :status

  delegate :data, :data=, to: :location_area, prefix: true, allow_nil: true

  default_scope -> { order(:updated_at) }

  belongs_to :device
  belongs_to :user

  has_one :emergency_contact, class_name: 'Contact', through: :user

  has_one :activity_area, as: :locatable, class_name: 'Location'
  has_one :return_area, as: :locatable, class_name: 'Location'

  after_create :set_user_from_device

  def duration=(hours)
    self.end_time = Time.now + hours.hours
  end

  def status
    case
    when completed?
      :completed
    when in_return_time_range? && device_has_returned?
      update_attributes completed: true
      :completed
    when in_progress?
      :in_progress
    else
      :lost
    end
  end

  def time_remaining
    self.end_time - Time.now
  end

  private

  def device_has_returned?
    return_area.contains_device? device
  end

  def in_return_time_range?
    return_time_range.cover? Time.now
  end

  def in_progress?
    Time.now <= return_time_range.last
  end

  def set_user_from_device
    self.user = device.user
  end

  def return_time_range
    start_time = end_time - 1.hour
    end_time   = end_time + 1.hour
    start_time..end_time
  end

  def time_has_elapsed?
    !in_progress?
  end

end
