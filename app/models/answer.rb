class Answer < ActiveRecord::Base
  belongs_to :sentence

  validates_presence_of :text

  def check t=''
    r = Regexp.new text

    r.match t
  end
end
