class Event < ApplicationRecord

  validates_presence_of :title,
    :message => "Title must be present"
  validates_presence_of :description,
    :message => "Description must be present"
  validates_length_of :date, :is => 8


end
