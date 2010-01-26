require 'test_helper'

class UnitTest < ActiveSupport::TestCase
  def setup
    @unit = units(:unit_one)
  end

  subject { @unit }

  should_have_many :exercises

  should_validate_presence_of :name, :number

  should_validate_uniqueness_of :number

  test 'should accepts_nested_attributes_for :exercises' do
    assert_difference('Exercise.count', 2) {
      assert @unit.update_attribute :exercises_attributes, exercises_attributes 
    }

    #should reject empty
    assert_no_difference('Exercise.count') {
      assert @unit.update_attribute :exercises_attributes, [{ :number => nil, :description => '' }]
    }

    #should destroy
    assert_difference('Exercise.count', -1) {
      assert @unit.update_attribute :exercises_attributes, [{ :id => first_exercise.id, :_destroy => true }]
    }
  end

  test 'fullname' do
    assert_equal "#{@unit.number}. #{@unit.name}", @unit.fullname  
  end

  private
  def exercises_attributes
    [{ :number => 1, :description => 'Complete the sentences' }, { :number => 2, :description => 'Answer the questions'}]
  end

  def first_exercise
    @unit.exercises.first
  end
end
