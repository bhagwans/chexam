# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    ruby-3.0.0 

* System dependencies
    Ubuntu 18.04.6 LTS 

* Database creation
    rake db:create

* How to run the test suite
    => rspec spec/controllers/user_exams_controller_spec.rb

* Setup instructions
    1. rake db:create
    2. rake db:migrate
    3. rake db:seed
    4. rails s

* Assigning exam to user
     
    * Request => POST http://localhost:3000/user_exams 

    * Request body => 
    {
        "user_exam": {
            "first_name": "Bhagwan",
            "last_name": "Suwarnkar",
            "phone_number": "7899437415",
            "college_id": 1,
            "exam_id": 1,
            "start_time": "2023-05-16 13:38:38"
        }
    }

* Notes: 
    1. College, Exam, Exam Window and a default user records iares created with rake db:seed
    2. Exam window record is created with start_time with current time and end time with start_time + 4 hours
    3. While assigning exam to user, valid start time can be given with Time.now.to.utc

