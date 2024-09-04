require 'rails_helper'

RSpec.describe "restaurants/edit", type: :view do
  let(:restaurant) {
    Restaurant.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:restaurant, restaurant)
  end

  it "renders the edit restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurant_path(restaurant), "post" do

      assert_select "input[name=?]", "restaurant[name]"
    end
  end
end
