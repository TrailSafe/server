require 'spec_helper'

describe Activity do

  context 'matchers' do
    subject { described_class.new }
    it { should belong_to :device }
    it { should belong_to :user }
  end

  subject(:activity) { FactoryGirl.create(:activity) }

  describe '#duration=' do
    it 'should set the duration in minutes from the current time' do
      expect { activity.duration = 30 }.to change {
        activity.end_time.to_i
      }.to be_within(1).of (Time.now + 30.minutes).to_i
    end
  end

  describe 'status' do
    before do
      activity.created_at = 1.hour.ago
      activity.end_time   = 5.minutes.from_now
    end
    context 'given the activity has completed' do
      before { subject.completed = true }
      its(:status) { should eq :completed }
    end

    context 'given the device has safely returned' do
      before(:each) do
        activity.stub(:in_return_time_range?).and_return(true)
        activity.stub(:device_has_returned?).and_return(true)
      end
      its(:status) { should eq :completed }
    end

    context 'given the activity is still in progress' do
      before do
        activity.stub(:device_has_returned?).and_return(false)
        activity.end_time = 5.hours.from_now
      end
      its(:status) { should eq :in_progress }
    end

    context "given the device doesn't meet any of the above conditions" do
      before do
        activity.stub(:device_has_returned?).and_return(false)
        activity.end_time = 5.hours.ago
      end
      its(:status) { should eq :lost }
    end
  end

  describe '#time_remaining' do
    before do
      activity.created_at = 1.hour.ago
      activity.end_time   = 5.minutes.from_now
    end
    it 'should be the time left in the activity' do
      activity.time_remaining.should be_within(1).of(5.minutes)
    end
  end

  describe '#set_user_from_device' do
    it 'should set the user to the devices user' do
      activity.send(:set_user_from_device)
      activity.user.should eq activity.device.user
    end
  end

  describe '#device_has_returned' do
    it "should call contains_device? on the return_area with the device" do
      activity.return_area.should_receive(:contains_device?).with(activity.device)
      activity.send(:device_has_returned?)
    end
  end

  describe '#in_return_time_range?' do
    context 'the activity is nearing completion' do
      it "should return true" do
        activity.created_at = 5.hours.ago
        activity.end_time   = Activity.buffer.from_now - 10
        activity.send(:in_return_time_range?).should be_true
      end
    end

    context 'the activity is nearing expiration' do
      it "should return true" do
        activity.created_at = 5.hours.ago
        activity.end_time   = Activity.buffer.ago + 10
        activity.send(:in_return_time_range?).should be_true
      end
    end

    context 'the activity has recently started' do
      it "should return false" do
        activity.created_at = 1.minute.ago
        activity.end_time   = 5.hours.from_now
        activity.send(:in_return_time_range?).should be_false
      end
    end

    context 'the activity has expired' do
      it "should return false" do
        activity.created_at = 5.hours.ago
        activity.end_time   = 10.seconds.ago - Activity.buffer
        activity.send(:in_return_time_range?).should be_false
      end
    end
  end

  describe '#in_progress?' do
    context 'if the event has started' do
      it 'should return true' do
        activity.send(:in_progress?).should be_true
      end
    end

    context 'if the event has expired' do
      it 'should return true' do
        activity.created_at = 5.hours.ago
        activity.end_time   = Activity.buffer.ago
        activity.send(:in_progress?).should be_false
      end
    end
  end

end
