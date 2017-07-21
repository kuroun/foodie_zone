class AddUserWithDevise < SeedMigration::Migration
  def up
    Admin.create(name: 'Admin 1', email: 'admin1@gmail.com', password: '123456', password_confirmation: '123456')
    RestaurantOwner.create(name: 'Owner 1', email: 'owner1@gmail.com', password: '123456', password_confirmation: '123456')
  end

  def down
    Admin.find_by(name: 'Admin 1')&.destroy
    RestaurantOwner.find_by(name: 'Owner 1')&.destroy
  end
end
