class CreateIncomeCategoryMappings < ActiveRecord::Migration[5.0]
  def change
    create_table :income_category_mappings do |t|
	  t.belongs_to :icategory
	  t.references :icategorized, polymorphic: true, index: {:name => "icategorized_id"}
      t.timestamps
    end
  end
end
