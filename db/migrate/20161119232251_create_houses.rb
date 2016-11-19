class CreateHouses < ActiveRecord::Migration[5.0]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :code
      t.integer :capacity
      t.string :stage
      t.references :admin

      t.timestamps
    end
  end
end
