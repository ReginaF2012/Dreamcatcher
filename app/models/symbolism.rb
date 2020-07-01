class Symbolism < ApplicationRecord
    has_many :dream_symbolisms
    has_many :dreams, through: :dream_symbolisms
end
