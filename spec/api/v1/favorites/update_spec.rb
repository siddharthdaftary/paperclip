require 'rails_helper'

RSpec.describe "favorites#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/favorites/#{favorite.id}", payload
  end

  describe 'basic update' do
    let!(:favorite) { create(:favorite) }

    let(:payload) do
      {
        data: {
          id: favorite.id.to_s,
          type: 'favorites',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FavoriteResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { favorite.reload.attributes }
    end
  end
end
