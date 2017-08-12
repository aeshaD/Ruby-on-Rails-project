class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
	  t.integer :amount
	  t.belongs_to :user
      t.timestamps
    end
  end
end
