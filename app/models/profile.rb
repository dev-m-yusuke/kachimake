class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  validates :name, presence: true
  validates :age, presence: true
  validates :occupation, presence: true
  validates :experience, presence: true
  
end
