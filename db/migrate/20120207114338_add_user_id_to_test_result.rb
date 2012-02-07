class AddUserIdToTestResult < ActiveRecord::Migration
  def change
    add_column :test_results, :user_id, :integer
    add_column :test_results, :team_id, :integer
  end
end
