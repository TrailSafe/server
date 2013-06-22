require 'spec_helper'

describe Api::ApplicationController do
  render_views

  describe 'GET #invalid_url' do

    it 'should return a proper error' do
      routes.draw { get 'invalid_url' => 'api/application#invalid_url' }
      get :invalid_url, format: :json
      response.status.should eq 404
      response.should render_template :error
      JSON.parse(response.body)['error'].should be_present
    end

  end

  context 'private methods' do

    describe '#authorization_header' do
      it 'should be set to the HTTP auth header' do
        request.env['HTTP_AUTHORIZATION'] = SecureRandom.hex 64
        controller.send(:authorization_header).should eq request.env['HTTP_AUTHORIZATION']
      end
    end

    describe '#current_device' do

      it 'should return an instance of device' do
        controller.send(:current_device).should be_an_instance_of Device
      end

      it 'should only #call find_or_create_by_uuid once' do
        Device.should_receive(:find_or_create_by_uuid).once.and_return('something')
        2.times.each { controller.send(:current_device) }
      end

      it 'should change the current_device instance variable' do
        expect { controller.send(:current_device) }.to change {
          controller.instance_variable_get :@current_device
        }
      end

      context 'given a valid uuid' do

        before(:each) do
          controller.should_receive(:device_uuid_header).and_return(SecureRandom.uuid)
        end

        it 'should not have errors' do
          controller.send(:current_device).errors.should_not be_present
        end

      end

      context 'given a invalid uuid' do

        it 'should not have errors' do
          controller.send(:current_device).errors.should be_present
        end

      end
    end

    describe 'current_user' do

      it 'should call user on device' do
        controller.send(:current_device).should_receive(:user)
        controller.send(:current_user)
      end

      context 'given the user exists' do

        before { controller.send(:current_device).should_receive(:user).and_return(FactoryGirl.create :user) }

        it 'should be an instance of user' do
          controller.send(:current_user).should be_a User
        end

        it 'should return a persisted user record' do
          controller.send(:current_user).should be_persisted
        end

      end

      context 'given the user does not exist' do

        it 'should be nil' do
          controller.send(:current_user).should be_nil
        end

      end

    end

    describe '#device_uuid_header' do
      it 'should be set to the HTTP device header' do
        request.env['HTTP_DEVICE_ID'] = SecureRandom.uuid
        controller.send(:device_uuid_header).should eq request.env['HTTP_DEVICE_ID']
      end
    end

    describe 'record_not_found' do
      it 'should call render_error with the correct status and message' do
        exception_mock = mock.tap { |m| m.stub(:message).and_return('an error message') }
        controller.should_receive(:render_error).with(message: exception_mock.message, status: 404)
        controller.send(:record_not_found, exception_mock)
      end
    end

    describe 'render_error' do
      before :each do
        described_class.send :public, :render_error
        described_class.send :skip_before_filter, :verify_api_key!, :verify_device!, only: :render_error
        routes.draw { get 'render_error' => 'api/application#render_error' }
        get :render_error, format: :json
      end

      it 'should have a status of 400' do
        response.status.should eq 400
      end

      it 'should render the error template' do
        response.should render_template :error
      end

      it 'should assign @error_message' do
        assigns(:error_message).should be_present
      end
    end

    describe 'verify_api_key!' do
      context 'when the api is not present' do
        it 'should call render_error with a 401 status' do
          controller.should_receive(:render_error).with(message: 'Invalid API key', status: 401)
          controller.send(:verify_api_key!)
        end
      end

      context 'when the api is invalid' do
        it 'should call render_error with a 401 status' do
          request.env['HTTP_AUTHORIZATION'] = SecureRandom.hex 64
          controller.should_receive(:render_error).with(message: 'Invalid API key', status: 401)
          controller.send(:verify_api_key!)
        end
      end

      context 'when the api is valid' do
        it 'should never call render_error' do
          ENV['API_KEY'] = SecureRandom.hex 64
          request.env['HTTP_AUTHORIZATION'] = ENV['API_KEY']
          controller.should_not_receive(:render_error)
          controller.send(:verify_api_key!)
        end
      end
    end

    describe 'verify_device!' do

    end

  end
end
