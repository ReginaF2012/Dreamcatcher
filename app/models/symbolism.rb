class Symbolism < ApplicationRecord
    has_many :dream_symbolisms, dependent: :destroy
    has_many :dreams, through: :dream_symbolisms
    has_many :users, through: :dream_symbolisms
    validates :name, presence: true, uniqueness: true
    scope :with_public_meanings, -> {joins(:dreams).where('dreams.is_public = true')}


    def has_public_meanings?
        self.dreams.where(is_public: true).references(:dream_symbolism).pluck(:meaning).any?
    end

end
