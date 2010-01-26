require 'test_helper'

class UnitsControllerTest < ActionController::TestCase
  def setup
    @unit = Unit.first
  end

  should_route :get, '/units/1/quiz', :controller => :units, :action => :quiz, :id => 1

  test 'get index' do
    get :index

    assert_response :success
    assert_template :index
  end

  test 'get new' do
    get :new

    assert @unit = assigns(:unit)

    assert_response :success
    assert_template :new

    # should build new exercise
    assert @unit.exercises.last.new_record?

    # should build new sentence
    assert @unit.exercises.last.sentences.last.new_record?

    # should build new answer 
    assert @unit.exercises.last.sentences.last.answer.new_record?
  end

  test 'post create' do
    post :create, :unit => { :number => unit_next_number, :name => 'Past Perfect' }

    assert_redirected_to :controller => 'units', :action => :show, :id => assigns(:unit).id
  end

  test 'get show' do
    get :show, :id => @unit.id

    assert_response :success
    assert_template :show
  end

  test 'get edit' do
    get :edit, :id => @unit.id 

    assert @unit = assigns(:unit)

    assert_response :success
    assert_template :edit

    #should build new exercise
    assert @unit.exercises.last.new_record?

    # should build new sentences
    assert @unit.exercises.last.sentences.last.new_record?

    # should build new answer 
    assert @unit.exercises.last.sentences.last.answer.new_record?
  end

  test 'put update' do
    put :update, :id => @unit.id, :unit => { :name => 'Next Future' }

    assert_redirected_to :controller => 'units', :action => 'show', :id => @unit.id
  end

  test 'get quiz' do
    get :quiz, :id => @unit.id

    assert @unit = assigns(:unit)
    assert_response :success
    assert_template :quiz
  end

  private
  def unit_next_number
    unit = Unit.all.last
    unit ? unit.number + 1 : 1
  end
end
