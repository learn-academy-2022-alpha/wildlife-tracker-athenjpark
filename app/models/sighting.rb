class Sighting < ApplicationRecord
  belongs_to :animal
  validates :date, :latitude_degrees, :longitude_degrees, presence:true
end
