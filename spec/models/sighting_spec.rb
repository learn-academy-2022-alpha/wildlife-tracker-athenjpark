require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without a date' do
    sighting = Sighting.create(latitude_degrees:120, longitude_degrees:30)
    expect(sighting.errors[:date]).to_not be_empty
  end
  it 'is not valid without a latitude' do
    sighting = Sighting.create(date:"1997-03-29 03:30:00", longitude_degrees:30)
    expect(sighting.errors[:latitude_degrees]).to_not be_empty
  end
  it 'is not valid without a longitude' do
    sighting = Sighting.create(date:"1997-03-29 03:30:00", latitude_degrees:30)
    expect(sighting.errors[:longitude_degrees]).to_not be_empty
  end
end
