desc "Fill the database tables with some sample data"
task :sample_data => :environment do
  p "Creating sample data"

  if Rails.env.development?
    Table.destroy_all
    p "Database wiped"
  end

  10.times do |i|
    Table.create(seats: rand(2..8), name: "Table #{i + 1}")
  end

  12.times do
    name = Faker::Name.name.capitalize
    party_size = rand(1..8)
    if party_size <= 2
      description = "Seating for #{party_size}"
    else
      description = "Party of #{party_size}"
    end
    date = Faker::Date.between(from: 2.days.ago, to: Date.today)
    start_time = Faker::Time.between_dates(from: Date.today - 1, to: Date.today)
    end_time = start_time + 1.hour
    table = Table.order("RANDOM()").first
    if table.available?(start_time, end_time)
      Reservation.create(
        name: name,
        description: description,
        date: date,
        start_time: start_time,
        end_time: end_time,
        table: table,
        party_size: party_size,
      )
    end
  end

  p "Created #{Reservation.all.count} reservations."
end
