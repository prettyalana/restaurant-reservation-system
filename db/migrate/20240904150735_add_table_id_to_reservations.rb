class AddTableIdToReservations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :table, foreign_key: true
  end
end
