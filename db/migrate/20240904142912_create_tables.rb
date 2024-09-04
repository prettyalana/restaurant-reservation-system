class CreateTables < ActiveRecord::Migration[7.1]
  def change
    create_table :tables do |t|
      t.integer :seats, default: 10

      t.timestamps
    end
  end
end
