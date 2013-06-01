class UserContact < ActiveRecord::Base

  default_scope ->{ order(:updated_at) }

  belongs_to :user
  belongs_to :contact
end
