class CreateExpenseCategoryMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :expense_category_mappings do |t|
	  t.belongs_to :category
	  t.references :categorized, polymorphic: true, index: {:name => "categorized_id"}
      t.timestamps
    end
  end
end
