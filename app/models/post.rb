class Post < ApplicationRecord
  has_many_attached :images
  
  validates :content, presence: true
  # has_one :user
  belongs_to :user
end
