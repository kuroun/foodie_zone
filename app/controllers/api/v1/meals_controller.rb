class Api::V1::MealsController < Api::ApiController
  version 1

  before_action :valid_owner?, only: [:destroy]

  def get_all_meals
    expose Meal.get_all_meals(params[:zone_id], params[:day])
  end

  def destroy
    expose @meal.destroy
  end

  private

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

  def valid_owner?
    authenticate
    set_meal
    unless(@meal&.restaurant.restaurant_owner_id == @user.id)
      render_forbidden
    end
  end
end
