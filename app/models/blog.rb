class Blog < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :favorites, dependent: :destroy
  # has_many :favorites_users, through: :favorites, sources: :user
end
