class AddMeal < SeedMigration::Migration

  def initialize
    @restaurants = []
    (1..30).each do |i|
      restaurant = Restaurant.find_by(name: "Restaurant #{i}")
      unless restaurant.nil?
        @restaurants.push(restaurant)
      end
    end
    @meals = []
    (1..10).each do |i|
      @meals.push("Meal #{i}")
    end
  end

  def up
    @restaurants.each do |restaurant|
      @meals.each do |meal|
        Meal.create(name: "#{meal}_#{restaurant.id}", restaurant_id: restaurant.id)
      end
    end
  end

  def down
    @restaurants.each do |restaurant|
      @meals.each do |meal|
        Meal.find_by(name: "#{meal}_#{restaurant.id}")&.destroy
      end
    end
  end
end
