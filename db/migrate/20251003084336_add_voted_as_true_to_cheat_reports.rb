class AddVotedAsTrueToCheatReports < ActiveRecord::Migration[8.0]
  def change
    add_column :cheat_reports, :voted_as_true, :integer
  end
end
