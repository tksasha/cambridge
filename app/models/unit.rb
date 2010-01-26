class Unit < ActiveRecord::Base
  has_many :exercises

  validates_presence_of :name, :number
  validates_uniqueness_of :number

  accepts_nested_attributes_for :exercises, :allow_destroy => true, :reject_if => proc { |a| a['number'].to_i <= 0 || a['description'].to_s.empty? }

  default_scope :order => :number

  def fullname
    "#{number}. #{name}"
  end
end

