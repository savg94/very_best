class AddDishCountToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :dishes_count, :integer
  end
end
