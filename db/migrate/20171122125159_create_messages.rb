class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :user_id, :users, foreign_key: true
      t.string :receive_name
      t.integer :message_state_id, :message_states, foreign_key: true

      t.timestamps
    end
  end
end
