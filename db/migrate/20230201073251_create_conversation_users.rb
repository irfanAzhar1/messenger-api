class CreateConversationUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :conversation_users do |t|
      t.integer :user_id
      t.integer :conversation_id

      t.timestamps
    end
  end
end
