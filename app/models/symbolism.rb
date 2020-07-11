class Symbolism < ApplicationRecord
    has_many :dream_symbolisms
    has_many :dreams, through: :dream_symbolisms

    def meanings
        self.dream_symbolisms.map( &:meaning )
    end
end
