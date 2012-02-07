class CreateDocketDocuments < ActiveRecord::Migration
  def change
    create_table :docket_documents do |t|
      t.integer :docket_id
      t.integer :document_id

      t.timestamps
    end
  end
end
