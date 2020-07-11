class DreamSymbolism < ApplicationRecord
  belongs_to :dream, optional: true
  belongs_to :symbolism, optional: true
  accepts_nested_attributes_for :symbolism, reject_if: proc { |attributes| attributes['name'].blank? }
end
