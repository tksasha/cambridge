class Answer < ActiveRecord::Base
  belongs_to :sentence

  validates_presence_of :text, :sentence_id
end
