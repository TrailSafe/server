class Device < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  belongs_to :user
  has_many :activities, through: :user
  has_many :locations, as: :locatable

end
