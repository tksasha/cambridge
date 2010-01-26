class AddNumberUniqueIndexOnUnits < ActiveRecord::Migration
  def self.up
    add_index :units, :number, :unique => true
  end

  def self.down
    remove_index :units, :number
  end
end
