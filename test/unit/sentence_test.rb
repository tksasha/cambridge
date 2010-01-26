require 'test_helper'

class SentenceTest < ActiveSupport::TestCase
  def setup
    @sentence = sentences(:sentence_one)
  end

  subject { @sentence }

  should_belong_to :exercise

  should_have_many :answers

  should_validate_presence_of :text, :exercise_id

  should_validate_uniqueness_of :number, :scoped_to => :exercise_id  

  test 'should accepts_nested_attributes_for :answers' do
    assert_difference('Answer.count', 2) {
      assert @sentence.update_attribute :answers_attributes, answers_attributes
    }

    #should destroy
    assert_difference('Answer.count', -1) {
      assert @sentence.update_attribute :answers_attributes, [{ :id => first_answer.id, :_destroy => true }]
    }

    #should reject if empty
    assert_no_difference('Answer.count') {
      assert @sentence.update_attribute :answers_attributes, [{ :text => '' }]
    }
  end

  private
  def answers_attributes
    [{ :text => 'Yes, I am.' }, { :text => 'No, I am not.' }]
  end

  def first_answer
    @sentence.answers.first
  end
end

__END__
  context 'Sentence' do
    setup do
      @sentence = Factory(:answer).sentence
    end

    should '"destroy" return "false" when sentence.answers not empty' do
      assert_equal false, @sentence.answers.empty?
      assert_equal false, @sentence.destroy
    end

    should 'check sentence with good answer' do
      assert_equal 0, @sentence.all_answers_counter
      assert_equal 0, @sentence.good_answers_counter
      assert_equal 0.00, @sentence.rate
      
      assert @sentence.check('Hello!')
      
      assert_equal 1, @sentence.all_answers_counter
      assert_equal 1, @sentence.good_answers_counter
      assert_equal 1.00, @sentence.rate
    end

    should 'check sentence with invalid answer' do
      assert_equal 0, @sentence.all_answers_counter
      assert_equal 0, @sentence.good_answers_counter
      assert_equal 0.00, @sentence.rate
      
      assert_equal false, @sentence.check('Gut!')
      
      assert_equal 1, @sentence.all_answers_counter
      assert_equal 0, @sentence.good_answers_counter
      assert_equal 0.00, @sentence.rate
    end

    should 'check sentence with multiple answer' do
      assert_equal 0, @sentence.all_answers_counter
      assert_equal 0, @sentence.good_answers_counter
      assert_equal 0.00, @sentence.rate

      Factory(:answer, :sentence_id => @sentence.id, :text => "[I|We] don't know!")
      
      assert @sentence.check("I don't know!")
      assert @sentence.check("We don't know!")
      
      assert_equal 2, @sentence.all_answers_counter
      assert_equal 2, @sentence.good_answers_counter
      assert_equal 1.00, @sentence.rate
    end
  end
end
