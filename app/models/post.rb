class Post < ApplicationRecord
  has_many_attached :images
  
  validates :content, presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user'
end
