class Reservation < ApplicationRecord
  belongs_to :table

  validate :check_availability
  validate :check_party_size

  def self.ransackable_attributes(auth_object= nil)
    ["name", "date"]
  end


  private

  def check_availability
    unless table&.available?(start_time, end_time, id)
      errors.add(:base, "The table has already been reserved. Choose another table or reserve another time.")
    end
  end

  def check_party_size
    unless table&.can_accommodate?(party_size)
      errors.add(:base, "Your party is too large.")
    end

    if table&.at_capacity?(party_size)
      errors.add(:base, "The table is at its capacity.")
    end
  end
end
