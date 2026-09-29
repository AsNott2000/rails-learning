class CreateCases < ActiveRecord::Migration[8.2]
  def change
    create_table :cases, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.integer :type, null: false
      t.string :description
      t.decimal :amount, precision: 18, scale: 4, null: false
      t.timestamps
    end
  end
end
