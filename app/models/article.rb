class Article < ApplicationRecord
    belongs_to :author, class_name: 'User'
    include Visible
    has_many :comments, dependent: :destroy
    has_one_attached :image

    paginates_per 5

    validates :title, presence: true, length: { in: 3..30 }
    validates :body, presence: true, length: { in: 5..255 }

    scope :public_ar, ->(value = "public") { where(status: value) }
    scope :private_ar, -> { public_ar("private") }
    scope :ordered, ->(direction = :desc) { order(created_at: direction) }
    scope :include_author, -> { includes(:author) }
    scope :search, -> (query) do
        return if query.blank?

        where('title LIKE ? OR title LIKE ?', "#{query.squish}%", "% #{query.squish}%")
    end
end
