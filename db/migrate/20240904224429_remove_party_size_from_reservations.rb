class RemovePartySizeFromReservations < ActiveRecord::Migration[7.1]
  def change
    remove_column :reservations, :party_size, :integer
  end
end
