class Exercise < ActiveRecord::Base
  belongs_to :unit

  has_many :sentences

  validates_presence_of :number, :description
  
  accepts_nested_attributes_for :sentences, :allow_destroy => true, :reject_if => proc { |a| a['number'].to_i <=0 || a['text'].to_s.empty? } 
end

__END__
  before_destroy do |exercise|
    unless exercise.sentences.empty?
      exercise.errors.add('Cannot destroy', 'because sentences is not empty')
      false
    end
  end

  def image
    image = "/images/exercises/#{unit.number}.#{number}.png" 
    if File.exists?("#{RAILS_ROOT}/public#{image}")
      "<img src=\"#{image}\" class=\"sentences-image\"/>"
    end
  end

  def next_sentence_number
    sentence = sentences.all(:order => :number).last
    sentence ? (sentence.number + 1) : 1
  end
end
