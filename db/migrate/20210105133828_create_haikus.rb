class CreateHaikus < ActiveRecord::Migration[6.0]
  def change
    create_table :haikus do |t|
      t.string :haiku1
      t.string :haiku2
      t.string :haiku3
      t.integer :user_id

      t.timestamps
    end
  end
end
