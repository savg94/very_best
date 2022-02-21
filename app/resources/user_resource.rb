class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :email, :string
  attribute :password_digest, :string
  attribute :dish_id, :integer
  attribute :venue_id, :integer

  # Direct associations

  has_many   :favorite_dishes

  # Indirect associations

end
