class ExercisesController < ApplicationController
  before_filter :find_unit
  before_filter :find_exercise, :only => [:show, :edit, :update, :destroy]

  def index
    @exercises = @unit.exercises.all(:order => :number)
  end

  def create
    @exercise = @unit.exercises.build(params[:exercise])

    respond_to do |format|
      format.js {
        if @exercise.save
        else
          render :text => @exercise.errors.full_messages, :status => 500
        end
      }
    end
  end

  def update
    if @exercise.update_attributes(params[:exercise])
      redirect_to unit_exercises_path(@unit)
    else
      render :action => :edit
    end
  end

  def destroy
    respond_to do |format|
      format.js {
        if @exercise.destroy
          render :action => :create
        else
          render :text => @exercise.errors.full_messages, :status => 500
        end
      }
    end
  end

  private
  def find_unit
    @unit = Unit.find(params[:unit_id])
  end

  def find_exercise
    @exercise = @unit.exercises.find(params[:id]) 
  end
end
