class CreateTestScores < ActiveRecord::Migration
  def change
    create_table :test_scores do |t|
      t.integer :user_id
      t.integer :test_id
      t.integer :team_id
      t.integer :score

      t.timestamps
    end
  end
end
