class AddComponentIdToExample < ActiveRecord::Migration
  def change
    add_column :examples, :component_id, :integer
  end
end
