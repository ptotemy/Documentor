class AddDepartmentIdToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :department_id, :integer
  end
end
