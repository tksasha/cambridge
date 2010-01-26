class AnswersController < ApplicationController
  before_filter :find_unit_exercise_sentence
  before_filter :find_answer, :only => [:edit, :update, :destroy]
  
  def create
    @answer = @sentence.answers.build(params[:answer])
    
    respond_to do |format|
      format.js {
        if @answer.save
        else
          render :text => @answer.errors.full_messages, :status => 500
        end
      }
    end
  end

  def update
    if @answer.update_attributes(params[:answer])
      redirect_to unit_exercises_path(@unit)
    else
      render :action => :edit
    end
  end

  def destroy
    respond_to do |format|
      format.js {
        if @answer.destroy
          render :action => :create
        else
          render :text => @answer.errors.full_messages, :status => 500
        end
      }
    end
  end

  private
  def find_unit_exercise_sentence
    @unit = Unit.find(params[:unit_id])
    @exercise = @unit.exercises.find(params[:exercise_id])
    @sentence = @exercise.sentences.find(params[:sentence_id])
  end

  def find_answer
    @answer = @sentence.answers.find(params[:id])
  end
end
