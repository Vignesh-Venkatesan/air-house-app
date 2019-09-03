class AddOAuthToAccounts < ActiveRecord::Migration
  def change
  	add_column :accounts, :google_token, :string
    add_column :accounts, :google_refresh_token, :string
  end
end
