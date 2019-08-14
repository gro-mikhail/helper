class CreateResponseToOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :response_to_orders do |t|
      t.belongs_to :order
      t.belongs_to :worker

      t.timestamps
    end
  end
end
