require "rails_helper"

RSpec.describe FavoriteResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "favorites",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FavoriteResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Favorite.count }.by(1)
    end
  end

  describe "updating" do
    let!(:favorite) { create(:favorite) }

    let(:payload) do
      {
        data: {
          id: favorite.id.to_s,
          type: "favorites",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FavoriteResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { favorite.reload.updated_at }
      # .and change { favorite.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:favorite) { create(:favorite) }

    let(:instance) do
      FavoriteResource.find(id: favorite.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Favorite.count }.by(-1)
    end
  end
end
