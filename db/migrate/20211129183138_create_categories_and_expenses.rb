class CreateCategoriesAndExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :icon
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :expense

      t.timestamps
    end

    create_table :expenses do |t|
      t.string :name
      t.decimal :amount
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :category
      
      t.timestamps
    end
    
    create_table :categories_expenses, id: false do |t|
      t.belongs_to :category
      t.belongs_to :expense
    end
  end
end