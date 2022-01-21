FactoryBot.define do
  factory(:pet) do
    Pet.destroy_all
    name {Faker::Creature::Dog.name}
    breed {Faker::Creature::Dog.breed}
    species {"Dog"}
  end
end