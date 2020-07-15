class DreamSymbolism < ApplicationRecord
  belongs_to :dream
  belongs_to :symbolism
  validates :meaning, presence: true
  validates :symbolism_id, presence: true
  #? Was trying to come up with a way to clean up my Symbolism index views because they include meanings from dream_symbolism
  #? None of the below work
  # scope :names, -> { joins(:symbolism).pluck(:name)}
  # scope :is_public?, -> { joins(:dream).references(:dream).where("dreams.is_public = ?", true).pluck(:id) }


  # accepts_nested_attributes_for :symbolism, reject_if: proc  {|attribute| attribute['name'].blank? }
  # method below is like the accepts_nested_attributes_for, except it uses find_or_create_by to prevent duplicates
  def symbolism_attributes=(symbolism_attributes)
     symbolism = Symbolism.find_or_create_by(symbolism_attributes) unless symbolism_attributes[:name].blank?
     self.symbolism = symbolism if symbolism
     self.save
  end
  
  def name
    self.symbolism.name
  end

  def is_public?
    self.dream.is_public?
  end

end
