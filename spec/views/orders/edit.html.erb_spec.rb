require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      product: "MyString",
      user: "MyString",
      price: "9.99"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[product]"

      assert_select "input[name=?]", "order[user]"

      assert_select "input[name=?]", "order[price]"
    end
  end
end
