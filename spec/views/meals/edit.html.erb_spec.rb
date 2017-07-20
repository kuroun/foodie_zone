require 'rails_helper'

RSpec.describe "meals/edit", type: :view do
  before(:each) do
    @meal = assign(:meal, Meal.create!(
      :name => "MyString",
      :restaurant => Restaurant.create(name: 'Restaurant 1')
    ))
  end

  it "renders the edit meal form" do
    render

    assert_select "form[action=?][method=?]", meal_path(@meal), "post" do

      assert_select "input#meal_name[name=?]", "meal[name]"

      assert_select "input#meal_restaurant_id[name=?]", "meal[restaurant_id]"
    end
  end
end
