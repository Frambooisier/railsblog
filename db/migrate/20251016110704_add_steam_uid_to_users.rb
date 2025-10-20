class AddSteamUidToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :steam_uid, :string
    add_index :users, :steam_uid, unique: true
  end
end
