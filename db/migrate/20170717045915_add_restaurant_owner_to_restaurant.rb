class AddRestaurantOwnerToRestaurant < ActiveRecord::Migration
  def up
    add_column :restaurants, :restaurant_owner_id, :integer, index: true, foreign_key: true
  end

  def down
    remove_column :restaurants, :restaurant_owner_id
  end
end
