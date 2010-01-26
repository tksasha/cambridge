class SentencesController < ApplicationController
  before_filter :find_unit_and_exercise
  before_filter :find_sentence, :only => [:check, :edit, :update, :destroy]

  def index
    @sentences = @exercise.sentences
  end

  def create
    @sentence = @exercise.sentences.build(params[:sentence])

    respond_to do |format|
      format.js {
        if @sentence.save
        else
          render :text => @sentence.errors.full_messages, :status => 500
        end
      }
    end
  end

  def update
    if @sentence.update_attributes(params[:sentence])
      redirect_to unit_exercises_url(@unit)
    else
      render :action => :edit
    end
  end

  def destroy
    @sentence.destroy
    redirect_to unit_exercises_url(@unit)
  end

  def check
    respond_to do |format|
      format.js {
        if @sentence.check(params[:answer])
          render :text => true, :status => 200
        else
          render :text => false, :status => 404
        end
      }
    end
  end

  private
  def find_unit_and_exercise
    @unit = Unit.find(params[:unit_id])
    @exercise = @unit.exercises.find(params[:exercise_id])
  end

  def find_sentence
    @sentence = @exercise.sentences.find(params[:id])
  end
end
