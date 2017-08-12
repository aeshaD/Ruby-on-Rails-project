class IncomeCategoryMapping < ApplicationRecord
		belongs_to :icategory
		belongs_to :icategorized, polymorphic: true
end

