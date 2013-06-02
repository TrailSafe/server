class ActivityChecker

  def initialize

  end

  private

  def do_with_expired_activities
    Activity.incomplete.expired.find_each do |activity|
      help_request = activity.create_help_request
      help_request.alert_user!
    end
  end

  def expired_time
    Time.now + Activity.buffer
  end

end