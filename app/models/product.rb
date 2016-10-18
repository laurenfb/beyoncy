class Product < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :orders

  # product must have a name
  validates :name, presence: true

  # product must mave a price, that price must be an integer, and the price must be larger than zero
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # product must either be active or inactive
  validates :active, inclusion: { in: [true, false] }
  validates :active, exclusion: { in: [nil] }
end
