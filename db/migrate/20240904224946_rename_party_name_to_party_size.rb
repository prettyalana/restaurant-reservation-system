class RenamePartyNameToPartySize < ActiveRecord::Migration[7.1]
  def change
    rename_column :reservations, :party_number, :party_size
  end
end
