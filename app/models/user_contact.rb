class UserContact < ActiveRecord::Base
  has_one :user
  has_one :contact
end
