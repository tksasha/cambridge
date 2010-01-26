require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @exercise = exercises(:exercise_one)
  end

  subject { @exercise }

  should_belong_to :unit

  should_have_many :sentences

  should_validate_presence_of :number, :description
  should_validate_uniqueness_of :number, :scoped_to => :unit_id

  test 'should accepts_nested_attributes_for :sentences' do
    assert_difference('Sentence.count', 2) {
      assert @exercise.update_attribute :sentences_attributes, sentences_attributes
    }

    #should destroy
    assert_difference('Sentence.count', -1) {
      assert @exercise.update_attribute :sentences_attributes, [{ :id => first_sentence.id, :_destroy => true }]
    }

    #should reject empty
    assert_no_difference('Sentence.count') {
      assert @exercise.update_attribute :sentences_attributes, [{ :number => nil, :text => '' }]
    }
  end

  private
  def sentences_attributes
    [{ :number => next_sentence_number, :text => 'If I were a rich man' }, { :number => next_sentence_number + 1, :text => 'I would visit London' }]
  end

  def first_sentence
    @exercise.sentences.first
  end

  def next_sentence_number
    Sentence.all(:order => :number).first.number + 1
  end
end
