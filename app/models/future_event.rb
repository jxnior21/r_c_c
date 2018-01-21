class FutureEvent < ApplicationRecord

  validates_presence_of :title
  validates_length_of :date, :is => 8

end
