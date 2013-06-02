require 'spec_helper'

describe Api::UsersController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create', first_name: ''
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

end
