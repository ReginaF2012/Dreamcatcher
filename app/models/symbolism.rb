class Symbolism < ApplicationRecord
    has_many :dream_symbolisms, dependent: :destroy
    has_many :dreams, through: :dream_symbolisms
    validates :name, presence: true, uniqueness: true

    def meanings
        self.dream_symbolisms.map( &:meaning )
    end
end
