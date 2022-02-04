class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :product
      t.string :user
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
