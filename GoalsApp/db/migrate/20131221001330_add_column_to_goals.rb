class AddColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :category, :string, null: false, default: 'main'
  end
end
