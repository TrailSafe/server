class UserAlerter < BaseAlerter

  def invoke!
    send_text_message(user.phone_number)
  end

  def message
    <<-SMS
Hello #{user.first_name}, it looks like you have been active with #{current_activity.name} for longer than expected.
If you are okay, please respond with any text message.
    SMS
  end

end