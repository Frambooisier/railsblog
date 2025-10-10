class AddSteamUrlToCheatReports < ActiveRecord::Migration[8.0]
  def change
    add_column :cheat_reports, :steam_url, :string
  end
end
