class Event < ApplicationRecord

  def to_param
   title
  end

  has_many :customers

  validates_presence_of :title
  validates_presence_of :description
  validates_length_of :date, :is => 8
  validates_presence_of :price


end
