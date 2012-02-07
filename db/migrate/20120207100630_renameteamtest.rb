class Renameteamtest < ActiveRecord::Migration
  def up
    rename_table :team_tests,:teams_tests
  end

  def down
  end
end
