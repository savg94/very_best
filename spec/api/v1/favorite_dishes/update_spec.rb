require "rails_helper"

RSpec.describe "favorite_dishes#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/favorite_dishes/#{favorite_dish.id}", payload
  end

  describe "basic update" do
    let!(:favorite_dish) { create(:favorite_dish) }

    let(:payload) do
      {
        data: {
          id: favorite_dish.id.to_s,
          type: "favorite_dishes",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FavoriteDishResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { favorite_dish.reload.attributes }
    end
  end
end
