class CreateBurrs < ActiveRecord::Migration[8.2]
  def change
    create_table :burrs, id: :uuid do |t|
      t.references :department, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.decimal :amount, precision: 18, scale: 4, null: false
      t.string :description
      t.timestamps
    end
  end
end
