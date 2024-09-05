require "rails_helper"

RSpec.describe Reservation, type: :model do
  # TODO belongs_to table keeps failing
  it { should belong_to(:table) }

  context "when checking for availability" do
    let (:table) { Table.create(name: "Table 1", seats: 4) }
    let (:reservation) do
      Reservation.new(
        name: "Alana Edwards",
        description: "Table for two",
        table: table,
        start_time: Time.now,
        end_time: 1.hour.from_now,
        party_size: 2,
      )
    end

    it "shows an error when the table is not available" do
      allow(table).to receive(:at_capacity?).and_return(true)
      reservation.valid?
      expect(reservation.errors[:base]).to include("The table is at its capacity. No more reservations until the reservation is over.")
    end

    it "shows successful reservation when the table is available" do
      allow(table).to receive(:can_accommodate?).and_return(true)
      allow(table).to receive(:at_capacity?).and_return(false)
      reservation.valid?
      expect(reservation.errors[:base]).to be_empty
    end
  end
end
