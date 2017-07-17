require 'rails_helper'

RSpec.describe "zones/index", type: :view do
  before(:each) do
    assign(:zones, [
      Zone.create!(
        :name => "Name 1"
      ),
      Zone.create!(
        :name => "Name 2"
      )
    ])
  end

  it "renders a list of zones" do
    render
    assert_select "tr>td", :text => "Name 1".to_s, :count => 1
    assert_select "tr>td", :text => "Name 2".to_s, :count => 1
  end
end
