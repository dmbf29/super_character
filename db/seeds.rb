require 'faker'

500.times do
  name = Faker::Superhero.power
  unless Power.find_by(name: name)
    power = Power.create!(
      name: name
    )
  end

  name = Faker::TvShows::Simpsons.character
  unless Character.find_by(name: name)
    Character.create!(
      name: name
    )
  end
end


Character.find_each do |character|
  next if character.powers.any?

  CharacterPower.create!(
    character: character,
    power: Power.all.sample
  )
end
