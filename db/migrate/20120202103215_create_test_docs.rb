class CreateTestDocs < ActiveRecord::Migration
  def change
    create_table :test_docs do |t|
      t.integer :document_id

      t.timestamps
    end
  end
end
