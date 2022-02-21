require "rails_helper"

RSpec.describe "favorite_dishes#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorite_dishes", params: params
  end

  describe "basic fetch" do
    let!(:favorite_dish1) { create(:favorite_dish) }
    let!(:favorite_dish2) { create(:favorite_dish) }

    it "works" do
      expect(FavoriteDishResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["favorite_dishes"])
      expect(d.map(&:id)).to match_array([favorite_dish1.id, favorite_dish2.id])
    end
  end
end
