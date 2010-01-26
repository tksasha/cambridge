class UnitsController < ApplicationController
  before_filter :find_unit, :only => [:show, :edit, :update, :destroy, :quiz]

  def index
    @units = Unit.all
  end

  def new
    @unit = Unit.new
    @unit.exercises.build
    @unit.exercises.map{ |e| e.sentences.build }
    @unit.exercises.each{ |e|
      e.sentences.map{ |s| s.build_answer }
    }
  end

  def create
    @unit = Unit.new params[:unit]

    if @unit.save
      redirect_to @unit
    else
      render :action => :new
    end
  end

  def update
    if @unit.update_attributes(params[:unit])
      redirect_to @unit
    else
      render :action => :edit
    end
  end

  def destroy
    @unit.destroy

    redirect_to units_url
  end

  def edit
    @unit.exercises.build
    @unit.exercises.map{ |e| e.sentences.build }
    @unit.exercises.each{ |e|
      e.sentences.map{ |s| s.build_answer unless s.answer }
    }
  end

  private
  def find_unit
    @unit = Unit.find params[:id]
  end
end
