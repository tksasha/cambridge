require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  def setup 
    @answer = answers(:answer_one)
  end

  should_route :get, '/answers/1/check/text_of_answer', :controller => :answers, :action => :check, :id => 1, :text => 'text_of_answer'

  test 'get check' do
    get :check, :id => @answer.id, :text => 'fu'
    
    assert_response :success
    assert assigns(:answer)
  end
end
