class NamesValidator < ActiveModel::Validator
  def validate(record)
    if record.common_name == record.latin_name
      record.errors.add :base, "Common name and latin name cannot be the same."
    end
  end
end

class Animal < ApplicationRecord
  has_many :sightings
  accepts_nested_attributes_for :sightings 
  validates :common_name, :latin_name, presence:true
  validates :common_name, :latin_name, uniqueness:true
  validates_with NamesValidator
end
