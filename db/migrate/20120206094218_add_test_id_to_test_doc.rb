class AddTestIdToTestDoc < ActiveRecord::Migration
  def change
    add_column :test_docs, :test_id, :integer
  end
end
