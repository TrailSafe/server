require 'spec_helper'

describe HelpRequestsController do

  # This should return the minimal set of attributes required to create a valid
  # HelpRequest. As you add validations to HelpRequest, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # HelpRequestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET show" do
    it "assigns the requested help_request as @help_request" do
      help_request = HelpRequest.create! valid_attributes
      get :show, {:id => help_request.to_param}, valid_session
      assigns(:help_request).should eq(help_request)
    end
  end

end
