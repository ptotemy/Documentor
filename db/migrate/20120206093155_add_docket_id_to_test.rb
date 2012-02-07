class AddDocketIdToTest < ActiveRecord::Migration
  def change
    add_column :tests, :docket_id, :integer
  end
end
