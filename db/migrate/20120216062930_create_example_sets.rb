class CreateExampleSets < ActiveRecord::Migration
def self.up
create_table :example_sets do |t|
      t.string :name
t.timestamps
    end
  end

  def self.down
    drop_table :example_sets
  end
end


