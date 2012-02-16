class AddExampleSetIdToExample < ActiveRecord::Migration
  def change
    add_column :examples, :example_set_id, :integer
  end
end
