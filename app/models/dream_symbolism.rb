class DreamSymbolism < ApplicationRecord
  belongs_to :dream, optional: true
  belongs_to :symbolism
end
