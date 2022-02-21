require "rails_helper"

RSpec.describe FavoriteDishResource, type: :resource do
  describe "serialization" do
    let!(:favorite_dish) { create(:favorite_dish) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(favorite_dish.id)
      expect(data.jsonapi_type).to eq("favorite_dishes")
    end
  end

  describe "filtering" do
    let!(:favorite_dish1) { create(:favorite_dish) }
    let!(:favorite_dish2) { create(:favorite_dish) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: favorite_dish2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([favorite_dish2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:favorite_dish1) { create(:favorite_dish) }
      let!(:favorite_dish2) { create(:favorite_dish) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      favorite_dish1.id,
                                      favorite_dish2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      favorite_dish2.id,
                                      favorite_dish1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
