class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.text :description
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
