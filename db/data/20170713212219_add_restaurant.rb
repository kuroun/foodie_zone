class AddRestaurant < SeedMigration::Migration

  def initialize
    @restaurants = []
    (1..30).each do |i|
       @restaurants.push("Restaurant #{i}")
    end
  end

  def up
    @restaurants.each do |restaurant|
      Restaurant.create(name: restaurant)
    end
  end

  def down
    @restaurants.each do |restaurant|
      Restaurant.find_by(name: restaurant)&.destroy
    end
  end
end
