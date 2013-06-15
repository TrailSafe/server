require 'spec_helper'

describe User do
  it { should have_many(:user_emergency_associations).class_name('User::EmergencyContact') }
  it { should have_many(:emergency_contacts).through(:user_emergency_associations).class_name('Contact') }

  context 'class methods' do
    subject(:user) { FactoryGirl.create :user }

    describe '.authenticate' do
      it 'should find a user by their username and authenticate them with a password' do
        described_class.authenticate(user.phone_number, user.password).should be_present
      end
    end
  end

  context 'instance methods' do
    subject(:user) { FactoryGirl.create :user }

    describe '#password_digest' do
      it 'should call digest on its secure password' do
        user.secure_password.should_receive(:digest)
        user.password_digest
      end
    end

    describe '#password_digest=' do
      it 'should create a new password' do
        value = SecureRandom.base64
        User::Password.should_receive(:new)
        FactoryGirl.build :user, password: value, password_confirmation: value
      end
    end

  end
end
