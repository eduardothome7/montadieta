class AddUnityToFood < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :is_unity, :bool
  end
end
