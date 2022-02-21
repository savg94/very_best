class AddVenueReferenceToDishes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :dishes, :venues
    add_index :dishes, :venue_id
  end
end
