class Product < ApplicationRecord
	belongs_to :category
	validates :price, presence: true
	before_validation :set_premium
	
	scope :premium_n, -> {where(premium: true)}
	scope :last_n, ->(cant) {order('id DESC').limit(cant)}
	def set_premium
		self.premium ||= false # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
	end
end
