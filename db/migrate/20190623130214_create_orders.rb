class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :title
      t.string :description
      t.string :address
      t.integer :price

      t.timestamps
    end
  end
end
