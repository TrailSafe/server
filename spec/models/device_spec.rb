require 'spec_helper'

describe Device do

  subject(:device){ FactoryGirl.build :device }

  context 'associations' do
    subject { described_class.new }
    it { should belong_to :user }
  end

  describe '.verified' do
    it "should only return verified devices" do
      new_devices = 3.times.map { FactoryGirl.create :device }
      verified_devices = 3.times.map { FactoryGirl.create :device, verified_on: Time.now }

      results = described_class.verified

      results.should_not include *new_devices
      results.should include *verified_devices
    end
  end

  describe '#verify!' do
    context 'when not set' do
      it 'should change the value of verified_on' do
        expect { device.verify! }.to change { device.verified_on }.from(nil).to(Time)
      end
    end

    context 'when already set' do
      it 'should not change the value of verified_on' do
        device.verified_on = Time.now
        expect { device.verify! }.to_not change { device.verified_on }
      end
    end
  end

  describe 'verified?' do
    context 'when verified_on is present' do
      it 'should be true' do
        device.verified_on = Time.now
        device.verified?.should be_true
      end
    end

    context 'when verified_on is not present' do
      it 'should be false' do
        device.verified_on = nil
        device.verified?.should be_false
      end
    end
  end

  describe '#send_verification_text' do

  end

end
