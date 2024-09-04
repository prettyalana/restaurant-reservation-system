class Reservation < ApplicationRecord
  belongs_to :table

  validates :start_time, :end_time, :party_size, presence: true

end
