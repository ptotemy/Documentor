class CreateTestTeams < ActiveRecord::Migration
  def change
    create_table :test_teams do |t|
      t.integer :team_id
      t.integer :test_id

      t.timestamps
    end
  end
end
