class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :mail, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { mail.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :blogs
  has_many :favorites, dependent: :destroy
end
