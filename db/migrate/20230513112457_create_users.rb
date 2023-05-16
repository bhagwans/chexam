class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :phone_number, null: false, unique: true
      t.belongs_to :college, null: false

      t.timestamps
    end
  end
end
