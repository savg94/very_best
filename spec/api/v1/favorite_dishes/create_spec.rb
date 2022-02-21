require 'rails_helper'

RSpec.describe "favorite_dishes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/favorite_dishes", payload
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
          type: 'favorite_dishes',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(FavoriteDishResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { FavoriteDish.count }.by(1)
    end
  end
end
