class RemoveColumnNameFromComment < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :name, :string
  end
end
