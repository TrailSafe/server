class User::Password < ActiveRecord::Base
  self.table_name = 'user_passwords'

  belongs_to :user
  validates_presence_of :digest
end
