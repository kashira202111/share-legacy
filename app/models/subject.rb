class Subject < ApplicationRecord
  belongs_to :year
  has_many :image_urls
end
