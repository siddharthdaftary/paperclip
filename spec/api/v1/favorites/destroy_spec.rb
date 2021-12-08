require 'rails_helper'

RSpec.describe "favorites#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/favorites/#{favorite.id}"
  end

  describe 'basic destroy' do
    let!(:favorite) { create(:favorite) }

    it 'updates the resource' do
      expect(FavoriteResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Favorite.count }.by(-1)
      expect { favorite.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
