class Dream < ApplicationRecord
    scope :made_public, -> { where(is_public: true) }
    validates :title, presence: :true, uniqueness: { scope: :user,
    message: "must be unique" }
    validates :content, presence: :true
    before_validation :set_title_if_blank
    belongs_to :user
    has_many :dream_symbolisms, dependent: :destroy
    has_many :symbolisms, through: :dream_symbolisms
    accepts_nested_attributes_for :dream_symbolisms, reject_if: proc { |attributes| attributes['meaning'].blank? }

    def set_title_if_blank
        title.blank? && update(title: "Dream ##{user.dreams.count + 1}")
    end
end