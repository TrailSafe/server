require "spec_helper"

describe HelpRequestsController do
  describe "routing" do

    it "routes to #index" do
      get("/help_requests").should route_to("help_requests#index")
    end

    it "routes to #new" do
      get("/help_requests/new").should route_to("help_requests#new")
    end

    it "routes to #show" do
      get("/help_requests/1").should route_to("help_requests#show", :id => "1")
    end

    it "routes to #edit" do
      get("/help_requests/1/edit").should route_to("help_requests#edit", :id => "1")
    end

    it "routes to #create" do
      post("/help_requests").should route_to("help_requests#create")
    end

    it "routes to #update" do
      put("/help_requests/1").should route_to("help_requests#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/help_requests/1").should route_to("help_requests#destroy", :id => "1")
    end

  end
end
