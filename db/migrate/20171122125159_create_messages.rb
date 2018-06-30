class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :receive_name
      
      t.references :users, :type => :bigint
      t.references :message_states, :type => :bigint


      t.timestamps
    end
  end
end
