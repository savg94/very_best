require 'rails_helper'

RSpec.describe Dish, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:cuisine) }

    it { should have_many(:favorite_dishes) }

    it { should belong_to(:venue) }

    end

    describe "InDirect Associations" do

    it { should have_many(:users) }

    end

    describe "Validations" do

    end
end
