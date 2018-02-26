class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.integer :diet_id
      t.string :name
      t.datetime :time_at

      t.timestamps
    end
  end
end
