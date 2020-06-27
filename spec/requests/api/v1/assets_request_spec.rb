require 'rails_helper'

RSpec.describe 'Api::V1::Assets', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/assets'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      site = create(:asset)
      get "/api/v1/assets/#{ asset.id }"
      expect(response).to have_http_status(:success)
    end
  end
end
