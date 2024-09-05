require 'rails_helper'

RSpec.describe Table, type: :model do
  it { should have_many(:reservations).dependent(:destroy) }
  it { should validate_numericality_of(:seats) }

  context "when checking for availability" do
    let (:table) { Table.create(name: "Table 1", seats: 4) }

    it "checks if table is at its capacity" do
      expect(table.at_capacity?(4)).to be(true)
      expect(table.at_capacity?(2)).to be(false)
    end

    it "checks if table can accommodate" do
      expect(table.can_accommodate?(2)).to be(true)
      expect(table.can_accommodate?(5)).to be(false)
    end

    it "checks if table is available" do
      # TODO
      # Test keeps failing
      Reservation.create!(
        name: "Alana Edwards",
        description: "Table for two",
        table: table,
        start_time: 1.hour.from_now,
        end_time: 2.hour.from_now,
        party_size: 2,
      )
      expect(table.available?(1.hour.from_now, 2.hours.from_now)).to be(false)
      expect(table.available?(3.hours.from_now, 4.hours.from_now)).to be(true)
    end
  end
end
