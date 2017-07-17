class AddRestaurantOwnerToRestaurant < ActiveRecord::Migration
  def up
    add_reference :restaurants, :restaurant_owner, index: true, foreign_key: true
  end

  def down
    remove_reference :restaurants, :restaurant_owner
  end
end
