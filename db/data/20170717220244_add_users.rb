class AddUsers < SeedMigration::Migration
  def up
    Admin.create(name: 'Admin 1')
    RestaurantOwner.create(name: 'Owner 1')
  end

  def down
    Admin.find_by(name: 'Admin 1')&.destroy
    RestaurantOwner.find_by(name: 'Owner 1')&.destroy
  end
end
