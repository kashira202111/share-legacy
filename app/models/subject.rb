class Subject < ApplicationRecord
  belongs_to :year
  has_many :image_urls
validates :subject_name,
    uniqueness: true,
    length: {minimum: 1, maximum: 20, too_long: "too long", too_short: "too short"}
validates :teacher_name,
    presence: true
end
