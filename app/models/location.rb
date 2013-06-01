class Location < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  belongs_to :locatable, polymorphic: true
end
