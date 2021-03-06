class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  mount_uploader :icon, ImageUploader

  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :comments, dependent: :destroy 

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 100 }

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
      user.like_hack = "パワーナップ"
    end
  end
  
  def self.admin_guest
    find_or_create_by!(email: 'admin@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト（管理者）"
      user.like_hack = "パワーナップ"
      user.admin = true
    end
  end
end
