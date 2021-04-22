class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :haiku1
      t.string :haiku2
      t.string :haiku3

      t.string :name
      t.string :email
      t.string :address
      
      t.boolean :permit
      t.integer :user_id
      t.timestamps
    end
  end
end
