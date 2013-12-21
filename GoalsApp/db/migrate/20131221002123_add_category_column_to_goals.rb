class AddCategoryColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :category_id, :integer, default: 1, null: false
  end
end
