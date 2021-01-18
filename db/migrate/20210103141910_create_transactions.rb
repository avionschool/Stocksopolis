class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :price
      t.string :stock_code
      t.integer :quantity

      t.timestamps
    end
  end
end
