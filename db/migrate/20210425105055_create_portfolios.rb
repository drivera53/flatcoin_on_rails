class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.text :description
      t.integer :current_balance
      t.integer :initial_balance
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
