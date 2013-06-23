class Location < ActiveRecord::Base
  include FormattedErrors

  belongs_to :locatable, polymorphic: true
end
