class AddUniqueIndexToRestaurantZoneDay < ActiveRecord::Migration
  def up
    add_index :restaurant_zone_days, [:restaurant_id, :zone_day_id], unique: true
  end

  def down
    remove_index :restaurant_zone_days, [:restaurant_id, :zone_day_id]
  end
end
