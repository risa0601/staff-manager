class Party < ApplicationRecord
	validates :party_start, presence: true
	validates :station, length: { maximum: 255 }
end
