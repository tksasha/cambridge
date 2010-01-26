class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.integer :unit_id
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :exercises
  end
end
