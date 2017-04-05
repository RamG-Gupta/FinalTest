class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name	
      t.string :email
      t.string :password_digest
      t.date   :dob
      t.string :address
      t.string :country
      t.string :state
      t.integer :zip_code 
      t.boolean :kids
      t.string :user_role
      t.timestamps
    end
  end
end
