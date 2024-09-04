class AddPartyNumberToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :party_number, :integer
  end
end
