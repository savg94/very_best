class Dish < ApplicationRecord
  # Direct associations

  belongs_to :venue,
             :required => false,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    dish
  end

end
