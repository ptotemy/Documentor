class AddTestTypeIdToTest < ActiveRecord::Migration
  def change
    add_column :tests, :test_type_id, :integer
  end
end
