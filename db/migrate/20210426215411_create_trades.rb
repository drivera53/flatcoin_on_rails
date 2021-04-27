class CreateTrades < ActiveRecord::Migration[6.1]
  def change
    create_table :trades do |t|
      t.string :coin_name
      t.decimal :current_price
      t.integer :quantity
      t.integer :user_id
      t.integer :portfolio_id

      t.timestamps
    end
  end
end
