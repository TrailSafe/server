class HelpRequest < ActiveRecord::Base
  belongs_to :device

  before_create :generate_short_url!

  def been_rescued!
    update_attributes rescued_at: Time.now
  end

  private

  def generate_short_url!
    generated = SecureRandom.hex 5
    self.short_url = self.class.where(short_url: generated).exists? ? generate_short_url! : generated
  end

end
