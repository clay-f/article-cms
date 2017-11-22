class Message < ApplicationRecord
  belongs_to :message_state
  belongs_to :user
end
