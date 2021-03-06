class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.integer :level, default: 0, null: false

      t.timestamps
    end
  end
end
