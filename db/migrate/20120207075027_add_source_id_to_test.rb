class AddSourceIdToTest < ActiveRecord::Migration
  def change
    add_column :tests, :source_id, :integer
  end
end
