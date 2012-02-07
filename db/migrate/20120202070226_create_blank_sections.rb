class CreateBlankSections < ActiveRecord::Migration
def self.up
create_table :blank_sections do |t|
      t.integer :document_id
      t.integer :component_id
      t.integer :xpos
      t.integer :ypos
      t.integer :width
      t.integer :height
t.timestamps
    end
  end

  def self.down
    drop_table :blank_sections
  end
end


