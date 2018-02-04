class Customer < ApplicationRecord

  belongs_to :event

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :telephone
  validates_presence_of :address1
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_presence_of :first_name2
  validates_presence_of :last_name2
  validates_presence_of :relationship
  validates_presence_of :telephone2
  validates_presence_of :event_id

end
