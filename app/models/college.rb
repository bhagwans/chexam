class College < ApplicationRecord
    has_many :users
    has_many :exams
end
