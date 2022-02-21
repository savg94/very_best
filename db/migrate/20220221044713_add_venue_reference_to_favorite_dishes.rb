class AddVenueReferenceToFavoriteDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorite_dishes, :venues
    add_index :favorite_dishes, :venue_id
  end
end
