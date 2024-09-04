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
    party_number = rand(1..20)
    if party_number <= 2
      description = "Seating for #{party_number}"
    else
      description = "Party of #{party_number}"
    end
    date = Faker::Date.between(from: 2.days.ago, to: Date.today)
    time = Faker::Time.between(from: Time.now - 1, to: Time.now, format: :long)
    table = Table.order('RANDOM()').first
    Reservation.create(
      name: name,
      description: description,
      date: date,
      time: time,
      table: table,
    )
  end

  p "Created #{Reservation.all.count} reservations."
end
