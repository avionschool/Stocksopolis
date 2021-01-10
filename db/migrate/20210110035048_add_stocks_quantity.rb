class AddStocksQuantity < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :stock_quantity, :integer
  end
end
