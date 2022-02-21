class Venue < ApplicationRecord
  # Direct associations

  belongs_to :neighborhood

  has_many   :favorite_dishes,
             dependent: :nullify

  has_many   :dishes,
             dependent: :nullify

  # Indirect associations

  has_many   :favorited_dishes,
             through: :favorite_dishes,
             source: :dish

  has_many   :users,
             through: :favorite_dishes,
             source: :user

  # Validations

  # Scopes

  def to_s
    name
  end
end
