require 'rails_helper'

RSpec.describe Dish, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:venue) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end