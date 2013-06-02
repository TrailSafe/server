class BaseAlerter

  delegate :current_activity, :emergency_contact, :user, to: :@help_request

  def initialize(help_request)
    @help_request = help_request
  end

  def invoke!
    raise NotImplementedError, '`Invoke` has not been implemented here.'
  end

  def message
    ''
  end

  private

  def send_text_message(phone_number, message = self.message)
    twilio_client.account.sms.messages.create(
      to:   phone_number,
      body: message,
      from: twilio_phone_number
    )
  end

  def help_url
    'http://trl.io/' + SecureRandom.hex(5)
    # Rails.application.routes.url_helpers.help_request_url(@help_request.short_url)
  end

  def twilio_client
    @client ||= Twilio::REST::Client.new twilio_sid, twilio_key
  end

  def twilio_sid
    ENV['TWILIO_SID'].to_s
  end

  def twilio_key
    ENV['TWILIO_KEY'].to_s
  end

  def twilio_phone_number
    ENV['TWILIO_PHONE'].to_s
  end

end