class Party < ApplicationRecord
	validates :party_start, presence: true
	validates :station, length: { maximum: 255 }
	
	has_many :shift_dicisions, dependent: :destroy
	has_many :shiftin_users, through: :shift_dicisions, source: :user
end
