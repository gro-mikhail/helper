class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :phone_number
      t.string :about
      t.integer :rating

      t.timestamps
    end
  end
end
