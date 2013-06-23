require 'spec_helper'

describe Api::UsersController do
  include_context 'valid api controller'

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
  end

  describe 'GET #show' do
    let(:perform_request) do
      get :show, subdomain: 'api', format: :json
    end
    context 'if the user exists' do
      before :each do
        controller.stub(:current_user) { FactoryGirl.create :user }
      end
      it 'should be successful' do
        perform_request
        response.should be_a_success
      end
    end

    context 'if the user does not exist' do
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
          pending
        end

        it 'should update the user' do
          pending
        end
        
      end
      
      context 'if the model is invalid' do
        
        it 'should return with errors' do
          pending
        end
        
      end
    end

    context 'if the user does not exist' do
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
      pending
    end

    context 'if the user does not exist' do
      it 'should not be successful' do
        perform_request
        response.status.should_not < 400
        response.should render_template :error
      end
    end
  end


end
