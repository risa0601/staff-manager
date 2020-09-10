class Skill < ApplicationRecord
  validates :skill_name, length: { maximum: 255 }
  
  has_many :having_skills, dependent: :destroy
  has_many :have_users, through: :having_skills, source: :user
end
