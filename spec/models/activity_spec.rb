require 'spec_helper'

describe Activity do

  context 'matchers' do
    subject { described_class.new }
    it { should belong_to :device }
    it { should belong_to :user }
  end

  subject(:activity) { FactoryGirl.create(:activity) }

  describe '#set_user_from_device' do

    it 'should set the user to the devices user' do
      activity.send(:set_user_from_device)
      activity.user.should eq activity.device.user
    end
  end
end
