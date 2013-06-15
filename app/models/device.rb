class Device < ActiveRecord::Base

  # Attributes
  attr_readonly :uuid

  # Associations
  belongs_to :user

  # Validations
  validates :uuid, presence: true, uniqueness: true

end
