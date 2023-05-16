class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name, null: false
      t.belongs_to :exam_window, null: false
      t.belongs_to :college, null: false

      t.timestamps
    end
  end
end
