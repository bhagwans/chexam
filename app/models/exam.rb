class Exam < ApplicationRecord
    belongs_to :college
    belongs_to :exam_window
    has_many :user_exams
    has_many :users, through: :user_exams
end
