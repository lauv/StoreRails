class Product < ApplicationRecord
	belongs_to :category
	validates :price, presence: true
	validates_inclusion_of :discount, :in => 1..100
	before_validation :set_premium
	after_destroy :delete_category

	scope :premium_n, -> {where(premium: true)}
	scope :last_n, ->(cant) {order('id DESC').limit(cant)}
	
	def set_premium
		self.premium ||= false # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
	end

	def delete_category
		a = Product.all.where(category_id: self.category_id)
		if a.length == 0
			c = Category.find_by(id: self.category_id)
			c.destroy
		end 
	end

	def add_discount
		precio_final = price - ((price * discount)/100)
	end
end
