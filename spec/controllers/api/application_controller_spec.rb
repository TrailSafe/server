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
    
    describe '#current_device' do
      context 'given a valid uuid' do

        before(:each) do
          controller.should_receive(:device_uuid_header).and_return(SecureRandom.uuid)
        end

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

        it 'should not have errors' do
          controller.send(:current_device).errors.should_not be_present
        end

      end

      context 'given a invalid uuid' do

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

        it 'should not have errors' do
          controller.send(:current_device).errors.should be_present
        end

      end
    end
    
  end
end
