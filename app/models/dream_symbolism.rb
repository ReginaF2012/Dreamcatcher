class DreamSymbolism < ApplicationRecord
  belongs_to :dream
  belongs_to :symbolism
  validates :meaning, presence: true
  validates :symbolism_id, presence: true
  # accepts_nested_attributes_for :symbolism, reject_if: proc  {|attribute| attribute['name'].blank? }

  def symbolism_attributes=(symbolism_attributes)
     symbolism = Symbolism.find_or_create_by(symbolism_attributes) unless symbolism_attributes[:name].blank?
     self.symbolism = symbolism if symbolism
     self.save
  end
  
  def name
    self.symbolism.name
  end

end
