class AddFavoriteDishCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favorite_dishes_count, :integer
  end
end
