class AnswersController < ApplicationController
  def check
    respond_to do |format|
      format.json {
        @answer = Answer.find params[:id] 
        if @answer.check params[:text]
          render :text => true, :status => 200
        else
          render :text => false, :status => 500
        end
      }
    end
  end
end
