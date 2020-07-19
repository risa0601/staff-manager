class Party < ApplicationRecord
	validates :station, length: { maximum: 255 }
end
