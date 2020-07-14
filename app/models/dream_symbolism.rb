class DreamSymbolism < ApplicationRecord
  belongs_to :dream
  belongs_to :symbolism
  validates :meaning, presence: true
  validates :symbolism, presence: true
  accepts_nested_attributes_for :symbolism, reject_if: proc  {|attribute| attribute['name'].blank? }

  # def symbolism_attributes=(symbolism_attributes)
  #   symbolism = Symbolism.find_or_create_by(symbolism_attributes)
  #   self.symbolism = symbolism if symbolism
  # end
  
  def name
    self.symbolism.name
  end

end
