class AddUserReferenceToFavoriteDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorite_dishes, :users
    add_index :favorite_dishes, :user_id
    change_column_null :favorite_dishes, :user_id, false
  end
end
