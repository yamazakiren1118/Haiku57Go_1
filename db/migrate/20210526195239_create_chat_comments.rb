class CreateChatComments < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_comments do |t|
      t.string :chat1
      t.string :chat2
      t.string :chat3
      t.integer :user_id
      t.integer :chat_id
      t.timestamps
    end
  end
end
