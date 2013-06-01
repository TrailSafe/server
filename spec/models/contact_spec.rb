require 'spec_helper'

describe Contact do
  it { should have_one(:user_contact) }
  it { should have_one(:emergency_contact_for).through(:user_contact).class_name('User') }
end
