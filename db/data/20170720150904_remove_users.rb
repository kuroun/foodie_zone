class RemoveUsers < SeedMigration::Migration
  #NOTE: need this migration before add devise to users because we won't need this dummy data anymore
  def up
    Admin.find_by(name: 'Admin 1')&.destroy
    RestaurantOwner.find_by(name: 'Owner 1')&.destroy
  end

  def down
    Admin.create(name: 'Admin 1')
    RestaurantOwner.create(name: 'Owner 1')
  end
end
