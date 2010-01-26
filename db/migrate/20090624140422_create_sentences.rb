class CreateSentences < ActiveRecord::Migration
  def self.up
    create_table :sentences do |t|
      t.integer :exercise_id
      t.string :text
      t.integer :number

      t.timestamps
    end
  end

  def self.down
    drop_table :sentences
  end
end
