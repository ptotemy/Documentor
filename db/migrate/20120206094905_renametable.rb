class Renametable < ActiveRecord::Migration
  def up
    rename_table :docket_documents,:dockets_documents
  end

  def down
  end
end
