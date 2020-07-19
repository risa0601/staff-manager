class User < ApplicationRecord
  authenticates_with_sorcery!
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :staff_no, presence: true, uniqueness: true	
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :trip, length: { maximum: 255 }
  validates :party_type, length: { maximum: 255 }
  
  has_many :shifts
  has_many :skills, through: :having_skills
  has_many :having_skills
  has_many :parties, through: :shift_dicisions
  has_many :shift_dicisions
  
end






