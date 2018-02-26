class CreateDiets < ActiveRecord::Migration[5.1]
  def change
    create_table :diets do |t|
      t.string :objective
      t.integer :tmb
      t.integer :kcal

      t.timestamps
    end
  end
end
