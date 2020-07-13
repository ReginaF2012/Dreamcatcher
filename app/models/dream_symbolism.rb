class DreamSymbolism < ApplicationRecord
  belongs_to :dream, optional: true
  belongs_to :symbolism
  validates :meaning, presence: true
  validates :symbolism, presence: true
  #accepts_nested_attributes_for :symbolism

  def symbolism_attributes=(symbolism_attributes)
    symbolism_attributes.each do |key, value|
      symbolism = Symbolism.find_or_create_by(name: value)
      self.symbolism = symbolism if self.save
    end
  end
 
  def name
    self.symbolism.name
  end

end
