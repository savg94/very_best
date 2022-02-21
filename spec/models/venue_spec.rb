require 'rails_helper'

RSpec.describe Venue, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:neighborhood) }

    it { should have_many(:favorite_dishes) }

    it { should have_many(:dishes) }

    end

    describe "InDirect Associations" do

    it { should have_many(:favorited_dishes) }

    it { should have_many(:users) }

    end

    describe "Validations" do

    end
end
