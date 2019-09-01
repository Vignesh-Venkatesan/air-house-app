class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :city
      t.string :locality
      t.string :address
      t.string :housetype
      t.integer :guests

      t.timestamps null: false
    end
  end
end
