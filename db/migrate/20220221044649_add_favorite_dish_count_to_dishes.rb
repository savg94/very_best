class AddFavoriteDishCountToDishes < ActiveRecord::Migration[6.0]
  def change
    add_column :dishes, :favorite_dishes_count, :integer
  end
end
