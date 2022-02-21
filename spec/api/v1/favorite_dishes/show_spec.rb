require "rails_helper"

RSpec.describe "favorite_dishes#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorite_dishes/#{favorite_dish.id}", params: params
  end

  describe "basic fetch" do
    let!(:favorite_dish) { create(:favorite_dish) }

    it "works" do
      expect(FavoriteDishResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("favorite_dishes")
      expect(d.id).to eq(favorite_dish.id)
    end
  end
end
