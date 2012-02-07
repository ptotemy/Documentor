class CreateTestResults < ActiveRecord::Migration
def self.up
create_table :test_results do |t|
      t.integer :test_doc_info_id
      t.integer :answer_key
t.timestamps
    end
  end

  def self.down
    drop_table :test_results
  end
end


