require 'rails_helper'

RSpec.describe "favorites#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/favorites", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'favorites',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FavoriteResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Favorite.count }.by(1)
    end
  end
end
