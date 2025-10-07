class AddVotedAstrueToCheatReports < ActiveRecord::Migration[8.0]
  def change
    add_column :cheat_reports, :voted_as_false, :integer
    add_column :cheat_reports, :voted_as_true_by, :string
    add_column :cheat_reports, :voted_as_false_by, :string
    add_column :cheat_reports, :reported_by, :string
  end
end
