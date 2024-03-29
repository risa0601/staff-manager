class User < ApplicationRecord
  authenticates_with_sorcery!
  
  validates :name, presence: true, length: { maximum: 255 }
  validates :staff_no, presence: true, uniqueness: true	
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :trip, length: { maximum: 255 }
  validates :party_type, length: { maximum: 255 }
  validates :adress, length: { maximum: 500 }
  validates :phone, length: { maximum: 255 }
  validates :memo ,length: { maximum: 700 }
  validates :position, length: { maximum: 200 }
  
  has_many :shifts, dependent: :destroy
  
  has_many :having_skills, dependent: :destroy
  has_many :skills, through: :having_skills, source: :skill
  
  has_many :shift_dicisions, dependent: :destroy
  has_many :parties, through: :shift_dicisions, source: :party
  
  
  def have(skill)
    self.having_skills.find_or_create_by(skill_id: skill.id)
  end
  
  def unhave(skill)
    have = self.having_skills.find_by(skill_id: skill.id)
    have.destroy if have
  end
  
  def have?(skill)
    self.skills.include?(skill)
  end
  
  def work(party)
    self.shift_dicisions.find_or_create_by(party_id: party.id)
  end
  
  def unwork(party)
    work = self.shift_dicisions.find_by(party_id: party.id)
    work.destroy if work
  end
  
  def work?(party)
    self.parties.include?(party)
  end
  
  scope :get_by_staff_no, ->(staff_no) {
    where("staff_no like ?", "%#{staff_no}%")
  }
  
  scope :get_by_name, ->(name) {
    where("name like ?", "%#{name}%")
  }

end
