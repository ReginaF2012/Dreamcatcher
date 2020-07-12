class DreamSymbolism < ApplicationRecord
  belongs_to :dream, optional: true
  belongs_to :symbolism
  validates :meaning, presence: true
  validates :symbolism, presence: true
  accepts_nested_attributes_for :symbolism

  def name
    self.symbolism.name
  end

end
