class Api::V1::MealsController < Api::ApiController
  version 1

  def get_all_meals
    expose Meal.get_all_meals(params[:zone_id], params[:day])
  end
end
