class Table < ApplicationRecord
  has_many :reservations

  #When a table is booked and a user tries to book the same table at the same time this error message should display:
  # "Sorry, that table has already been reserved. Please pick another time."

end
