Faker::TvShows::Simpsons.character



500.times do
  character = Faker::TvShows::Simpsons.character
  next if Character.find_by(name: Faker::TvShows::Simpsons.character)

  Character.create!(
    name: character
  )
end
