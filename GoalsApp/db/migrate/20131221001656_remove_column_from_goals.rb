class RemoveColumnFromGoals < ActiveRecord::Migration
  def up
    remove_column :goals, :category
  end

  def down
    add_column :goals, :category, :string
  end
end
