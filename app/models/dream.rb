class Dream < ApplicationRecord
    validates :title, presence: :true, uniqueness: { scope: :user,
    message: "must be unique" }
    validates :content, presence: :true
    before_create :set_title_if_blank
    belongs_to :user
    has_many :dream_symbolisms
    has_many :symbolisms, through: :dream_symbolisms
    accepts_nested_attributes_for :symbolisms

    def set_title_if_blank
        title.blank? && update(title: "Dream ##{user.dreams.count + 1}")
    end
end