class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :category_food_id, default: 0.0
      t.decimal :protein, default: 0.0
      t.decimal :carb, default: 0.0
      t.decimal :fat, default: 0.0
      t.decimal :kcal, default: 0.0
      t.bool :is_unity, default: false

      t.timestamps
    end
  end
end
