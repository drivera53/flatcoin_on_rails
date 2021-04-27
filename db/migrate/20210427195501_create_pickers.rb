class CreatePickers < ActiveRecord::Migration[6.1]
  def change
    create_table :pickers do |t|

      t.timestamps
    end
  end
end
