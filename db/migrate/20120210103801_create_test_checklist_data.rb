class CreateTestChecklistData < ActiveRecord::Migration
  def change
    create_table :test_checklist_data do |t|
      t.integer :test_id
      t.integer :team_id
      t.integer :user_id
      t.float :score

      t.timestamps
    end
  end
end
