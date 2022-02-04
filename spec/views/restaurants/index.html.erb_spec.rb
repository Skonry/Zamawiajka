require 'rails_helper'

RSpec.describe "restaurants/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        name: "Name"
      ),
      Restaurant.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
