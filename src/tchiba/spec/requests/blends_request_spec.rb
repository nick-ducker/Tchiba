require 'rails_helper'

RSpec.describe "Blends", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/blends/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/blends/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/blends/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/blends/delete"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/blends/update"
      expect(response).to have_http_status(:success)
    end
  end

end
