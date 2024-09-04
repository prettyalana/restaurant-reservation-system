class Reservation < ApplicationRecord
  belongs_to :table
  validates :start_time, :end_time, presence: true
end
