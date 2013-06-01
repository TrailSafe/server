require 'spec_helper'

describe User do
  it { should have_one(:device) }
  it { should have_one(:user_contact) }
  it { should have_one(:emergency_contact).through(:user_contact).class_name('Contact') }
end
