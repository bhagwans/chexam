class CreateUserExams < ActiveRecord::Migration[7.0]
  def change
    create_table :user_exams do |t|
      t.belongs_to :user
      t.belongs_to :exam
      t.timestamp :start_time
      t.timestamps
    end
  end
end
