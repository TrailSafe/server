require 'spec_helper'

describe Api::UsersController do
  include_context 'valid api controller'

  before(:all){ Rails.application.reload_routes! }

  let(:user){ FactoryGirl.create :user }

  describe 'POST #create' do
    let(:perform_request) do
      post :create, user: FactoryGirl.attributes_for(:user), subdomain: 'api', format: :json
    end

    it 'should be successful' do
      perform_request
      response.should be_a_success
    end

    it 'should create the user' do
      expect { perform_request }.to change { User.count }
    end

    it 'should assign the device to the user' do
      expect { perform_request }.to change { controller.send(:current_device).reload.user }
    end

    context 'if the model is invalid' do
      let(:perform_request) do
        post :create, user: FactoryGirl.attributes_for(:user, phone_number: nil), subdomain: 'api', format: :json
      end
      it 'should return with errors' do
        perform_request
        response.status.should eq 422
        response.should render_template :error
      end
    end
  end

  describe 'GET #show' do
    let(:perform_request) do
      get :show, subdomain: 'api', format: :json
    end
    context 'if the user exists' do
      it 'should be successful' do
        perform_request
        response.should be_a_success
      end
    end

    context 'if the user does not exist', valid_user: false do
      it 'should not be successful' do
        perform_request
        response.status.should_not < 400
        response.should render_template :error
      end
    end
  end

  describe 'PUT #update' do
    let(:perform_request) do
      put :update, user: FactoryGirl.attributes_for(:user), subdomain: 'api', format: :json
    end

    context 'if the user exists' do
      context 'if the model is valid' do
        it 'should be successful' do
          perform_request
          response.should be_a_success
        end

        it 'should update the user' do
          expect { perform_request }.to change { current_user.attributes }
        end
      end
      
      context 'if the model is invalid' do
        let(:perform_request) do
          put :update, user: FactoryGirl.attributes_for(:user, phone_number: nil), subdomain: 'api', format: :json
        end
        it 'should return with errors' do
          perform_request
          response.status.should eq 422
          response.should render_template :error
        end
      end
    end

    context 'if the user does not exist', valid_user: false do
      it 'should not be successful' do
        perform_request
        response.status.should_not < 400
        response.should render_template :error
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:perform_request) do
      delete :destroy, subdomain: 'api', format: :json
    end

    context 'if the user exists' do
      it 'should be successful' do
        perform_request
        response.should be_a_success
      end
    end

    context 'if the user does not exist', valid_user: false do
      it 'should not be successful' do
        perform_request
        response.status.should_not < 400
        response.should render_template :error
      end
    end
  end

  context 'private methods' do

    describe '#load_user' do
      it 'should set the user instance variable to the current_user' do
        expect { controller.send(:load_user) }.to change {
          controller.instance_variable_get(:@user)
        }.to controller.send(:current_user)
      end
    end

    describe '#user_params' do
      it 'should return the user params' do
        user_params = FactoryGirl.attributes_for(:user)
        controller.params = { user: user_params }
        controller.send(:user_params).to_hash.should include user_params.stringify_keys
      end
    end

  end

end
