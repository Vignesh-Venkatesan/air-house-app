class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :address
      t.integer :ph_no
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
