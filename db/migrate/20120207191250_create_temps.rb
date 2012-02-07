class CreateTemps < ActiveRecord::Migration
  def change
    create_table :temps do |t|
      t.text :data

      t.timestamps
    end
  end
end
