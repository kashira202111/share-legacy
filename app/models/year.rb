class Year < ApplicationRecord
  has_many :subjects 
  validates :year,
      uniqueness: true,
      numericality: {only_integer: true, greater_than: 1949, less_than: 2100}
end
