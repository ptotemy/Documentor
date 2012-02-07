class CreateDocuments < ActiveRecord::Migration
def self.up
create_table :documents do |t|
      t.string :name
      t.string :blank_form_file_name
t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end


