class CreateMessageStates < ActiveRecord::Migration[5.1]
  def change
    create_table :message_states do |t|
      t.string :state

      t.timestamps
    end
  end
end
