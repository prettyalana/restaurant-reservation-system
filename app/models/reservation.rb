class Reservation < ApplicationRecord
  belongs_to :table

  validate :check_availability
  validate :check_party_size


  private

  def check_availability
    unless table&.available?(start_time, end_time)
      errors.add(:base, "The table has already been reserved. Choose another table or reserve another time.")
    end
  end

  def check_party_size
    unless table&.can_accommodate?(party_size)
      errors.add(:base, "Your party is too large. Choose another table.")
    end

    if table&.at_capacity?(party_size)
      errors.add(:base, "The table is at its capacity. No more reservations until the reservation is over.")
    end
  end
end
