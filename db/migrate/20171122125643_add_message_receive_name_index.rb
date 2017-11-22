class AddMessageReceiveNameIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :messages, :receive_name
  end
end
