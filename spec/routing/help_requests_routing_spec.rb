require "spec_helper"

describe HelpRequestsController do
  describe "routing" do

    it "routes to #show" do
      get("/help_requests/1").should route_to("help_requests#show", :id => "1")
    end

  end
end
