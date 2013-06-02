class Device < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  belongs_to :user
  has_many :activities
  has_many :locations, as: :locatable
  has_many :help_requests

end
