class Expense < ApplicationRecord
	belongs_to :user
	has_one :expense_category_mapping, as: :categorized
	has_one :category, :through => :expense_category_mapping, as: :categorized
	validates :amount, numericality: {greater_than: 0 }, presence: true
	accepts_nested_attributes_for :category

	def category_attributes=(category_attributes)
		self.category = Category.find_or_create_by(:cname => category_attributes[:cname])
	end

end
