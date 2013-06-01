class Device < ActiveRecord::Base
  belongs_to :user
  has_many :activities, through: :user
  has_many :locations, as: :locatable
end
