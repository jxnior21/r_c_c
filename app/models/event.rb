class Event < ApplicationRecord

  validates_presence_of :title
  validates_presence_of :description
  validates_length_of :date, :is => 8


end
