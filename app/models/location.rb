class Location < ActiveRecord::Base
  belongs_to :locatable
  attr_accessible :lonlat, :reported_at
end
