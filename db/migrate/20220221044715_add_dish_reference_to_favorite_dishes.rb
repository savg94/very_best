class AddDishReferenceToFavoriteDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorite_dishes, :dishes
    add_index :favorite_dishes, :dish_id
    change_column_null :favorite_dishes, :dish_id, false
  end
end
