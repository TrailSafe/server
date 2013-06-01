class Location < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  belongs_to :locatable, polymorphic: true

  def contains_device?(device)
    # device.last_location is where we are!!!
    true
  end

end
