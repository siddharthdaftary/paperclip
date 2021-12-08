require 'rails_helper'

RSpec.describe "favorites#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorites", params: params
  end

  describe 'basic fetch' do
    let!(:favorite1) { create(:favorite) }
    let!(:favorite2) { create(:favorite) }

    it 'works' do
      expect(FavoriteResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['favorites'])
      expect(d.map(&:id)).to match_array([favorite1.id, favorite2.id])
    end
  end
end
