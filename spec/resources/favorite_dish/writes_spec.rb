require 'rails_helper'

RSpec.describe FavoriteDishResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'favorite_dishes',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FavoriteDishResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { FavoriteDish.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:favorite_dish) { create(:favorite_dish) }

    let(:payload) do
      {
        data: {
          id: favorite_dish.id.to_s,
          type: 'favorite_dishes',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FavoriteDishResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { favorite_dish.reload.updated_at }
      # .and change { favorite_dish.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:favorite_dish) { create(:favorite_dish) }

    let(:instance) do
      FavoriteDishResource.find(id: favorite_dish.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { FavoriteDish.count }.by(-1)
    end
  end
end
