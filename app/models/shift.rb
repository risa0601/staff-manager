class Shift < ApplicationRecord
  belongs_to :user
  
  validates :date, presence: true
  validates :category, length: { maximum: 255 }
end
