class ExpenseCategoryMapping < ApplicationRecord
		belongs_to :category
		belongs_to :categorized, polymorphic: true
end
