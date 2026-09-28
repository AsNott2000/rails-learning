class CreateDepartments < ActiveRecord::Migration[8.2]
  def change
    create_table :departments, id: :uuid do |t|
      t.string :department_name, limit: 255
      t.timestamps
    end
  end
end
