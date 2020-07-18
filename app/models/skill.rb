class Skill < ApplicationRecord
  belongs_to :user
  
  validates :skill_name, length: { maximum: 255 }
end
