class CreateRestaurantZoneDays < ActiveRecord::Migration
  def change
    create_table :restaurant_zone_days do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.references :zone_day, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
