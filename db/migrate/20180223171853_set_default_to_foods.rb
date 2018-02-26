class SetDefaultToFoods < ActiveRecord::Migration[5.1]
  def change
  	change_column :foods, :protein, :type, default: 0.0
  	change_column :foods, :carb, :type, default: 0.0
  	change_column :foods, :fat, :type, default: 0.0
  	change_column :foods, :kcal, :type, default: 0.0
  end
end
