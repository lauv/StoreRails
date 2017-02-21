class Product < ApplicationRecord
	belongs_to :category
	validates :price, presence: true
	before_validate : set_premium
	def set_premium
		self.premium ||= false # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
	end
end
