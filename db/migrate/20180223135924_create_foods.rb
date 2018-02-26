class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :category_food_id
      t.decimal :protein
      t.decimal :carb
      t.decimal :fat
      t.decimal :kcal

      t.timestamps
    end
  end
end
