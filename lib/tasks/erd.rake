namespace :erd do
  desc "Generate ERD Diagram in PNG Format"
  task generate_png: :environment do
  system("bundle exec erd --filetype=png ")
  end
end
