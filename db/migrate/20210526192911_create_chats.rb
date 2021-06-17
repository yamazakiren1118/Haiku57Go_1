class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :chat1
      t.string :chat2
      t.string :chat3
      t.integer :user_id
      t.integer :chat_comment_id
      t.timestamps
    end
  end
end
