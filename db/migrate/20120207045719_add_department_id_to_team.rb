class AddDepartmentIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :department_id, :integer
  end
end
