class Pet < ApplicationRecord
  validates :name, presence: true
  validates :breed, presence: true
  validates :species, presence: true
  validates_length_of :name, maximum: 25
  validates_length_of :breed, maximum: 50
  validates :species, inclusion: { in: %w(Cat cat Dog dog Bunny bunny),
    message: "%{value} is not a valid species" }
  scope :search_name, -> (name_parameter) { where("name ilike ?","%#{name_parameter}%") }
  scope :species_filter, -> (species_parameter) { where("species ilike ?","%#{species_parameter}%") }
  before_save(:titleize_name)
  before_save(:titleize_breed)
  before_save(:titleize_species)
  private
    def titleize_name
      self.name = self.name.titleize
    end
    def titleize_breed
      self.breed = self.breed.titleize
    end
    def titleize_species
      self.species = self.species.titleize
    end
end