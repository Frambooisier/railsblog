class CreateCheatReports < ActiveRecord::Migration[8.0]
  def change
    create_table :cheat_reports do |t|
      t.string :player_name, null: false
      t.text :description
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
