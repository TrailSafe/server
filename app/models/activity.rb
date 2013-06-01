class Activity < ActiveRecord::Base

  belongs_to :device
  # has_one :user, through: :device
  # has_many :contacts, through: :user

end
