class Renametabledocketdocumentsets < ActiveRecord::Migration
  def up
    rename_table :document_sets_dockets,:dockets_document_sets
  end

  def down
  end
end
