require 'rails_helper'

RSpec.describe "Api::V1::Sites", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/sites"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      site = create(:site)
      get "/api/v1/sites/#{ site.id }"
      expect(response).to have_http_status(:success)
    end
  end
end
