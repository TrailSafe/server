require 'spec_helper'

describe Api::DevicesController do
  include_context 'valid api controller'

  before(:all){ Rails.application.reload_routes! }

  describe 'GET #show' do
    it 'should render the show template' do
      get :show, format: :json
      response.should render_template :show
    end
  end

end
