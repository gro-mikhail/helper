class AddWorkerIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :worker_id, :integer, default: nil
  end
end
