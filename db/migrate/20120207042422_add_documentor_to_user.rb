class AddDocumentorToUser < ActiveRecord::Migration
  def change
    add_column :users, :documentor, :boolean
  end
end
