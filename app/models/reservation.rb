class Reservation < ApplicationRecord
  belongs_to :table

  validates :start_time, :end_time, :party_number, presence: true
  
end
