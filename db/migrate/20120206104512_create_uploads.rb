class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :xls_file_name

      t.timestamps
    end
  end
end
