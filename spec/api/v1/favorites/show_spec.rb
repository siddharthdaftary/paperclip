require "rails_helper"

RSpec.describe "favorites#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorites/#{favorite.id}", params: params
  end

  describe "basic fetch" do
    let!(:favorite) { create(:favorite) }

    it "works" do
      expect(FavoriteResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("favorites")
      expect(d.id).to eq(favorite.id)
    end
  end
end
