class User < ApplicationRecord
  # Direct associations

  has_many   :favorite_dishes,
             :dependent => :destroy

  # Indirect associations

  has_many   :venues,
             :through => :favorite_dishes,
             :source => :venue

  # Validations

  # Scopes

  def to_s
    name
  end

end
