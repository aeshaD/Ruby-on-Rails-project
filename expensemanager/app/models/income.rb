class Income < ApplicationRecord
	belongs_to :user
	has_one :income_category_mapping, as: :icategorized
	has_one :icategory, :through => :income_category_mapping, as: :icategorized
	validates :amount, numericality: {greater_than: 0 }, presence: true
	accepts_nested_attributes_for :icategory
	
	def icategory_attributes=(icategory_attributes)
		self.icategory = Icategory.find_or_create_by(:icname => icategory_attributes[:icname])
	end
end
