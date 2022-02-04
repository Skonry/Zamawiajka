require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      product: "MyString",
      user: "MyString",
      price: "9.99"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[product]"

      assert_select "input[name=?]", "order[user]"

      assert_select "input[name=?]", "order[price]"
    end
  end
end
