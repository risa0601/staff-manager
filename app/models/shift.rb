class Shift < ApplicationRecord
  belongs_to :user
  
  validates :date, presence: true
  validates :category, presence: true, length: { maximum: 255 }
  validates :content, length: { maximum: 255 }
end
