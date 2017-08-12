class CreateIcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :icategories do |t|
	  t.string :icname
      t.timestamps
    end
  end
end
