class Venue < ApplicationRecord
  # Direct associations

  has_many   :favorite_dishes,
             :dependent => :nullify

  has_many   :dishes,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
