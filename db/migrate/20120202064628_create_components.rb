class CreateComponents < ActiveRecord::Migration
def self.up
create_table :components do |t|
      t.string :name
      t.string :component_icon_file_name
t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end


