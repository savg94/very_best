class User < ApplicationRecord
  # Direct associations

  has_many   :favorite_dishes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
