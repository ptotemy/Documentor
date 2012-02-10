class CreateDocumentSetsDockets < ActiveRecord::Migration
  def change
    create_table :document_sets_dockets do |t|
      t.integer :docket_id
      t.integer :document_set_id

      t.timestamps
    end
  end
end
