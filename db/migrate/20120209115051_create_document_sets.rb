class CreateDocumentSets < ActiveRecord::Migration
def self.up
create_table :document_sets do |t|
      t.string :name
      t.integer :document_id
t.timestamps
    end
  end

  def self.down
    drop_table :document_sets
  end
end


