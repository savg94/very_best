class Dish < ApplicationRecord
  # Direct associations

  has_many   :favorite_dishes,
             :dependent => :destroy

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
