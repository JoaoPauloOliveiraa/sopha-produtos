class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :code
      t.integer :quantity
      t.string :brand
      t.datetime :manufactured_at
      t.datetime :due_date
      t.decimal :price
      t.decimal :cost_price

      t.timestamps
    end
  end
end
