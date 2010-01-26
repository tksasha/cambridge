require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  def setup 
    @answer = answers(:answer_one)
    @answer.update_attribute :text, 'Bla-bla, bla-bla-bla, bla-bla'
  end

  should_route :put, '/answers/1/check', :controller => :answers, :action => :check, :id => 1

  test 'get check' do
    put :check, :id => @answer.id, :text => 'Bla-bla, bla-bla-bla, bla-bla'
    
    assert_response :success
    assert assigns(:answer)
  end
end
