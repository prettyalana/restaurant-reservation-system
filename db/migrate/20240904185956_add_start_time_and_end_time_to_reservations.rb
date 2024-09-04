class AddStartTimeAndEndTimeToReservations < ActiveRecord::Migration[7.1]
  def change
    remove_columns :reservations, :time, :time
    add_column :reservations, :start_time, :time
    add_column :reservations, :end_time, :time
  end
end
