class Icategory < ApplicationRecord
has_many :income_category_mappings
has_many :incomes, through: :income_category_mappings, source: :categorized, :source_type => 'Income'
validates :icname, uniqueness: true, presence: true 
end
