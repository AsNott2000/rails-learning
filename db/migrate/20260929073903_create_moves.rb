class CreateMoves < ActiveRecord::Migration[8.2]
  def change
    create_table :moves, id: :uuid do |t|
      t.references :department, type: :uuid, null: false, foreign_key: true
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.decimal :amount, precision: 18, scale: 4, null: false
      t.integer :move_type, null: false
      t.string :description
    end
  end
end
