class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :comment1
      t.string :comment2
      t.string :comment3
      t.integer :user_id
      t.integer :haiku_id
      t.timestamps
    end
  end
end
