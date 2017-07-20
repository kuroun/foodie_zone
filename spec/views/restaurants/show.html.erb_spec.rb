require 'rails_helper'

RSpec.describe "restaurants/show", type: :view do
  # pending 'test it later when meal management is done...'
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "Restaurant 1",
      :address => "Address",
      :restaurant_owner => nil
    ))
    assign(:all_meals, [
      Meal.create!(
        :name => "Meal 1",
        :restaurant => @restaurant
      ),
      Meal.create!(
        :name => "Meal 2",
        :restaurant => @restaurant
      )
    ])
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(//)
  end

  it "renders a list of meals" do
    render
    assert_select "tr>td", :text => "Meal 1".to_s, :count => 1
    assert_select "tr>td", :text => "Meal 2".to_s, :count => 1

  end
end
