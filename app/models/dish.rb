class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  has_many   :favorite_dishes,
             :dependent => :destroy

  belongs_to :venue,
             :required => false,
             :counter_cache => true

  # Indirect associations

  has_many   :venues,
             :through => :favorite_dishes,
             :source => :venue

  has_many   :users,
             :through => :favorite_dishes,
             :source => :user

  # Validations

  # Scopes

  def to_s
    dish
  end

end
