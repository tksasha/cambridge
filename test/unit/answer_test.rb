require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  should_belong_to :sentence

  should_validate_presence_of :text, :sentence_id
end
