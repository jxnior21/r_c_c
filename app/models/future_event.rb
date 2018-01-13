class FutureEvent < ApplicationRecord

  validates_presence_of :title,
    :message => "Title must be present"
  validates_length_of :date, :is => 8

end
