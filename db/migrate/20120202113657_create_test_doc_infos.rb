class CreateTestDocInfos < ActiveRecord::Migration
  def change
    create_table :test_doc_infos do |t|
      t.integer :test_doc_id
      t.integer :blank_section_id
      t.integer :example_id

      t.timestamps
    end
  end
end
