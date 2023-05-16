# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

c = College.create(name: 'College1')

ew = ExamWindow.create(start_time: Time.now, end_time: Time.now + 4.hours)

Exam.create(college_id: c.id, exam_window_id: ew.id, name: "Exam1")

User.create(first_name: "Bhagwan", last_name: "Suwarnkar", college_id: c.id, phone_number: "7899437413")

