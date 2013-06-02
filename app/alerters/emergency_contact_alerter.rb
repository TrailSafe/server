class EmergencyContactAlerter < BaseAlerter

  def invoke!
    send_text_message(emergency_contact.phone_number)
  end

  def message
    <<-SMS
#{emergency_contact.first_name}, #{user.full_name} is in trouble, her last known location was #{hook_url} please
seek help immediately!
    SMS
  end

end