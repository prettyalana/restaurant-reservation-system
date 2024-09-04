class AddNameToTable < ActiveRecord::Migration[7.1]
  def change
    add_column :tables, :name, :string
  end
end
