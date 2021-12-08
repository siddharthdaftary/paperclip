require 'rails_helper'

RSpec.describe FavoriteResource, type: :resource do
  describe 'serialization' do
    let!(:favorite) { create(:favorite) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(favorite.id)
      expect(data.jsonapi_type).to eq('favorites')
    end
  end

  describe 'filtering' do
    let!(:favorite1) { create(:favorite) }
    let!(:favorite2) { create(:favorite) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: favorite2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([favorite2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:favorite1) { create(:favorite) }
      let!(:favorite2) { create(:favorite) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            favorite1.id,
            favorite2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            favorite2.id,
            favorite1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
