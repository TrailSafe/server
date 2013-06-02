class Activity < ActiveRecord::Base

  def self.buffer
    (ENV["BUFFER"] || 60).minutes
  end

  def self.expired_time
    Time.now + Activity.buffer
  end

  attr_reader :status

  delegate :data, :data=, to: :activity_area, prefix: true, allow_nil: true
  delegate :data, :data=, to: :return_area, prefix: true, allow_nil: true

  default_scope -> { order(:updated_at) }

  scope :incomplete, ->{ where(completed: [nil, false]) }
  scope :expired, ->{ where('end_time > :expired_time', expired_time: expired_time) }

  belongs_to :device
  belongs_to :user
  has_one :emergency_contact, class_name: 'Contact', through: :user
  has_one :activity_area, as: :locatable, class_name: 'Location'
  has_one :return_area, as: :locatable, class_name: 'Location'

  after_create :set_user_from_device

  validates_presence_of :name
  validates_presence_of :device

  def duration=(minutes)
    self.end_time = Time.now + minutes.minutes
  end

  def status
    case
    when completed? || (in_return_time_range? && device_has_returned?)
      :completed
    when in_progress?
      :in_progress
    else
      :lost
    end
  end

  def time_remaining
    (self.end_time - Time.now).to_i
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
    self.update_attributes user: device.user
  end

  def return_time_range
    start_of_buffer = end_time - Activity.buffer
    end_of_buffer = end_time + Activity.buffer
    start_of_buffer..end_of_buffer
  end

  def time_has_elapsed?
    !in_progress?
  end

end
