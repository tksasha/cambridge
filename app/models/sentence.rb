class Sentence < ActiveRecord::Base
  belongs_to :exercise

  has_one :answer

  validates_presence_of :text, :exercise_id, :number
  validates_uniqueness_of :number, :scope => [:exercise_id]

  accepts_nested_attributes_for :answer, :allow_destroy => true, :reject_if => proc { |a| a['text'].to_s.empty? }
end

__END__
  before_destroy do |sentence|
    unless sentence.answers.empty?
      sentence.errors.add('Cannot destroy', 'because answers is not empty')
      false
    end
  end

  def check(a)
    increment(:all_answers_counter)
    a.strip!

    result = false
    regexp = Regexp.new(/\[[A-Za-z0-9 |',]+\]/)

    answers.map(&:text).each do |answer|
      if variants = answer[regexp]
        variants.gsub!(/\[|\]/, '').split('|').each do |x|
          result = result || answer.gsub(regexp, x).eql?(a)
        end
      else
        result = result || answer.eql?(a) 
      end
    end

    increment(:good_answers_counter) if result
    
    rate_calculate

    result
  end

  private
  def rate_calculate
    update_attribute(:rate, good_answers_counter.to_f / all_answers_counter.to_f)
  end
end
