class DishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :dish, :string
  attribute :cuisine_id, :integer
  attribute :venue_id, :integer

  # Direct associations

  belongs_to :venue

  # Indirect associations

end
