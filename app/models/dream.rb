class Dream < ApplicationRecord
    belongs_to :user
    has_many :dream_symbolisms
    has_many :symbolisms, through: :dream_symbolisms
end