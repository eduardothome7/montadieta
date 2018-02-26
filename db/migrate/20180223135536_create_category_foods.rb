class CreateCategoryFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :category_foods do |t|
      t.string :name
      t.string :description
      t.string :icon

      t.timestamps
    end
  end
end
