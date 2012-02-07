class CreateTeamTests < ActiveRecord::Migration
  def change
    create_table :team_tests do |t|
      t.integer :test_id
      t.integer :team_id

      t.timestamps
    end
  end
end
