require 'rails_helper'

RSpec.describe "restaurants/new_meal", type: :view do
  before(:each) do
    assign(:meal, Meal.new(
      :name => "MyString",
      :restaurant => Restaurant.create(name: 'Restuarant 1')
    ))
  end

  it "renders new meal form" do
    render

    assert_select "form[action=?][method=?]", meals_path, "post" do

      assert_select "input#meal_name[name=?]", "meal[name]"

      assert_select "input#meal_restaurant_id[name=?]", "meal[restaurant_id]"
    end
  end
end
