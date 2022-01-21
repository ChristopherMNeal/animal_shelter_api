Pet.destroy_all
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_pets
  end

  def generate_pets
    20.times do |i|
      pet = Pet.create!(
        name: Faker::Creature::Cat.name,
        breed: Faker::Creature::Cat.breed,
        species: "Cat"
      )
      puts "Pet #{i}: #{pet.name} is a #{pet.breed} #{pet.species}."
    end
    20.times do |i|
      pet = Pet.create!(
        name: Faker::Creature::Dog.name,
        breed: Faker::Creature::Dog.breed,
        species: "Dog"
      )
      puts "Pet #{i}: #{pet.name} is a #{pet.breed} #{pet.species}."
    end
  end
end

Seed.begin