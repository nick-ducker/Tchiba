require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /profile" do
    it "returns http success" do
      get "/users/profile"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /reviewhistory" do
    it "returns http success" do
      get "/users/reviewhistory"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /ordertransactionhistory" do
    it "returns http success" do
      get "/users/ordertransactionhistory"
      expect(response).to have_http_status(:success)
    end
  end

end
