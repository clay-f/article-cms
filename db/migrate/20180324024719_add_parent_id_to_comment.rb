class AddParentIdToComment < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :parent_id, :integer, null: false, default: 0
  end
end
