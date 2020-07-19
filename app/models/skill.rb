class Skill < ApplicationRecord
  validates :skill_name, length: { maximum: 255 }
end
