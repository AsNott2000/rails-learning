class CreateUsers < ActiveRecord::Migration[8.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email_address, null: false, limit: 255
      t.string :password_digest, null: false, limit: 255
      t.string :phone, limit: 20
      t.string :name, null: false, limit: 100
      t.string :surname, null: false, limit: 100
      t.integer :role, null: false

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
