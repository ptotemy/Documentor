class CreateDockets < ActiveRecord::Migration
def self.up
create_table :dockets do |t|
      t.string :name
t.timestamps
    end
  end

  def self.down
    drop_table :dockets
  end
end


