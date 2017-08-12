class Category < ApplicationRecord
has_many :expense_category_mappings
has_many :expenses, through: :expense_category_mappings, source: :categorized, :source_type => 'Expense'
validates :cname, uniqueness: true, presence: true 
end
