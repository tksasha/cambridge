require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def setup 
    @answer = answers(:answer_one)

    @answer.update_attribute :text, 'Good (Answer|Response)'
  end

  subject { @answer }

  should_belong_to :sentence

  should_validate_presence_of :text

  test 'check' do
    #should alternative
    assert @answer.check('Good Answer')
    assert @answer.check('Good Response')

    #should is case sensitive
    assert !@answer.check('good response')

    #false if answer is empty
    assert !@answer.check('')
    
    #false if answer is undefined
    assert !@answer.check

    #false if answer is incorrect
    assert !@answer.check('Bad Answer')
  end
end
