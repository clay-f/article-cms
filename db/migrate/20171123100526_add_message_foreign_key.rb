class AddMessageForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :messages, :users, column: :user_id
    add_foreign_key :messages, :message_states, column: :message_state_id
  end
end
