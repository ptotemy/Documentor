class AddCorrectToExample < ActiveRecord::Migration
  def change
    add_column :examples, :correct, :boolean
  end
end
