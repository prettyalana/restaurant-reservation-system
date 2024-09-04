class ChangeSeatsDefault < ActiveRecord::Migration[7.1]
  def change
   change_column_default :tables, :seats, 4
  end
end
