class AddUniqueIndexSentencesNumberExerciseId < ActiveRecord::Migration
  def self.up
    add_index :sentences, [:exercise_id, :number], :unique => true
  end

  def self.down
    remove_index :sentences, [:exercise_id, :number]
  end
end
