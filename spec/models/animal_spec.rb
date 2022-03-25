require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without a common name' do
    animal = Animal.create(latin_name:"Panthera Leo", kingdom:"Mammal")
    expect(animal.errors[:common_name]).to_not be_empty
  end
  it 'is not valid without a latin name' do
    animal = Animal.create(common_name:"Lion", kingdom:"Mammal")
    expect(animal.errors[:latin_name]).to_not be_empty
  end
  it 'common name and latin name cannot be the same' do
    animal = Animal.create(common_name:"Lion", latin_name:"Lion", kingdom:"Mammal")
    expect(animal.errors[:base]).to_not be_empty
  end
  it 'is not valid if the common name is not unique' do
    animal_valid = Animal.create(common_name:"Lion", latin_name:"Panthera Leo", kingdom:"Mammal")
    animal_invalid = Animal.create(common_name:"Lion", latin_name:"Panthera Leo", kingdom:"Mammal")
    expect(animal_invalid.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if the latin name is not unique' do
    animal_valid = Animal.create(common_name:"Lion", latin_name:"Panthera Leo", kingdom:"Mammal")
    animal_invalid = Animal.create(common_name:"Lion", latin_name:"Panthera Leo", kingdom:"Mammal")
    expect(animal_invalid.errors[:latin_name]).to_not be_empty
  end
end
