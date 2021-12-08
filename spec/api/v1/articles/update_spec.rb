require 'rails_helper'

RSpec.describe "articles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/articles/#{article.id}", payload
  end

  describe 'basic update' do
    let!(:article) { create(:article) }

    let(:payload) do
      {
        data: {
          id: article.id.to_s,
          type: 'articles',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ArticleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { article.reload.attributes }
    end
  end
end
