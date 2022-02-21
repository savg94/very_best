class AddFavoriteDishCountToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :favorite_dishes_count, :integer
  end
end
