# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #before_filter :make_breadcrumb

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private
  def make_breadcrumb
    paths = {
      'units' => units_path,
      'exercises' => unit_exercises_path(params[:unit_id]),
      'sentences' => unit_exercise_sentences_path(params[:unit_id], params[:exercise_id]),
      'answers' => unit_exercise_sentence_answers_path(params[:unit_id], params[:exercise_id], params[:sentence_id])
    }
    
    path = request.path.split('?').first.split('/')
    @breadcrumb = path[1..-1].delete_if{ |c| 
      c.to_i > 0 
    }.map{ |c| 
      if !paths.include?(c) || path.last.eql?(c)
        I18n.t(c)
      else
        "<a href='#{paths[c]}'>#{I18n.t(c)}</a>"
      end
    }.join('::')
  end
end
