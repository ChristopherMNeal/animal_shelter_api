FactoryBot.define do
  factory(:pet) do
    name {Faker::Creature::Dog.name}
    breed {Faker::Creature::Dog.breed}
    species {"Dog"}
  end
end