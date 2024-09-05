class Table < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :seats, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 2,
    less_than_or_equal_to: 8
  }

  def available?(start_time, end_time)
    reservations.where('start_time < ? AND end_time > ?', end_time, start_time).empty?
  end

  def at_capacity?(party_size)
    party_size == seats
  end

  def can_accommodate?(party_size)
    seats >= party_size
  end

end
