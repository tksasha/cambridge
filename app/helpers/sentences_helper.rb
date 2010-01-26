module SentencesHelper
  def link_to_sentences exercise
    link_to 'sentences', unit_exercise_sentences_url(@unit, exercise)
  end

  def link_to_edit_sentence exercise, sentence
    link_to 'edit', edit_unit_exercise_sentence_url(@unit, exercise, sentence), :class => 'add-exercise'
  end

  def link_to_delete_sentence exercise, sentence
    link_to 'delete', unit_exercise_sentence_path(@unit, exercise, sentence), :method => :delete, :confirm => I18n.t(:'are you sure?')
  end
end
