require 'rails_helper'

RSpec.describe "favorite_dishes#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/favorite_dishes/#{favorite_dish.id}"
  end

  describe 'basic destroy' do
    let!(:favorite_dish) { create(:favorite_dish) }

    it 'updates the resource' do
      expect(FavoriteDishResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { FavoriteDish.count }.by(-1)
      expect { favorite_dish.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
