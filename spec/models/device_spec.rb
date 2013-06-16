require 'spec_helper'

describe Device do

  subject(:device){ FactoryGirl.build :device }

  context 'associations' do
    subject { described_class.new }
    it { should belong_to :user }
  end

  describe '.verified' do
    it "should only return verified devices" do
      new_devices = 5.times.map { FactoryGirl.create :device }
      verified_devices = 5.times.map { FactoryGirl.create :device, verified_on: Time.now }

      results = described_class.verified

      results.should_not include *new_devices
      results.should include *verified_devices

    end
  end
end
