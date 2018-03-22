class AddDescriptionToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :description, :string, null: false, default: 0
  end
end
