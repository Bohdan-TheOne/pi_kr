class Article < ApplicationRecord
    belongs_to :author, class_name: 'User'
    include Visible
    has_many :comments, dependent: :destroy

    validates :title, presence: true, length: { in: 3..30 }
    validates :body, presence: true, length: { in: 5..255 }
end
