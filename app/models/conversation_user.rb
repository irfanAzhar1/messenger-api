class ConversationUser < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :conversation_id, :user_id
end
