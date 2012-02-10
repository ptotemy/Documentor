class AddDocumentSetIdToDocument < ActiveRecord::Migration
  def change
    add_column :documents, :document_set_id, :integer
  end
end
