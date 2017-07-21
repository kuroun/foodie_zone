require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name1",
        :type => "Admin",
        :email => "name1@gmail.com",
        :password => "123456",
        :auth_token => "Auth Token"
      ),
      User.create!(
        :name => "Name2",
        :type => "RestaurantOwner",
        :email => "name2@gmail.com",
        :password => "123456",
        :auth_token => "Auth Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "Admin".to_s, :count => 1
    assert_select "tr>td", :text => "RestaurantOwner".to_s, :count => 1
    assert_select "tr>td", :text => "Auth Token".to_s, :count => 2
  end
end
