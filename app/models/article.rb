class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
