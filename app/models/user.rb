class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable
  has_many :articles, foreign_key: :author_id, inverse_of: :author
  ROLES = {
    user: 0,
    moder: 1,
    admin: 2
  }.with_indifferent_access.freeze

  enum role: ROLES
end