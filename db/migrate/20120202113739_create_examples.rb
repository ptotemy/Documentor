class CreateExamples < ActiveRecord::Migration
def self.up
create_table :examples do |t|
      t.string :name
      t.string :content_file_name
t.timestamps
    end
  end

  def self.down
    drop_table :examples
  end
end


