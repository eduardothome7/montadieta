class CreateMealFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :meal_foods do |t|
      t.integer :meal_id
      t.integer :food_id
      t.decimal :weight

      t.timestamps
    end
  end
end
