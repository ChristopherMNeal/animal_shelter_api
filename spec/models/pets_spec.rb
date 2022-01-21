require 'rails_helper'

describe Pet do
  before do
    @pet = Pet.create({name: "hel goddess of death", breed: "tabby", species: "cat"})
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :breed }
  it { should validate_presence_of :species }
  
  it("titleizes the name of a pet") do
    expect(@pet.name()).to(eq("Hel Goddess Of Death"))
  end
  it("titleizes the breed of a pet") do
    expect(@pet.breed()).to(eq("Tabby"))
  end
  it("titleizes the species of a pet") do
    expect(@pet.species()).to(eq("Cat"))
  end
end
