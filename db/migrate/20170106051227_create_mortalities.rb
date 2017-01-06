class CreateMortalities < ActiveRecord::Migration[5.0]
  def change
    create_table :mortalities do |t|
      t.integer :count
      t.references :house
      t.text :cause

      t.timestamps
    end
  end
end
