class Article < ApplicationRecord
    belongs_to :author, class_name: 'User'
    include Visible
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { in: 3..30 }
    validates :body, presence: true, length: { in: 5..255 }

    scope :public_ar, ->(value = "public") { where(status: value) }
    scope :private_ar, -> { public_ar("private") }
    scope :ordered, ->(direction = :desc) { order(created_at: direction) }
    scope :include_author, -> { includes(:author) }
end
