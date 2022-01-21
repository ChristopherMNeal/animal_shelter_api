class Pet < ApplicationRecord
  validates :name, presence: true
  validates :breed, presence: true
  validates :species, presence: true
  validates :species, inclusion: { in: %w(cat dog bunny),
    message: "%{value} is not a valid species" }
end