class UserExamService

    def self.validate_user_exam_data(params)
        errors = []
        college = CollegeService.college(params)
        exam = exam = ExamService.exam_in_college(college, params)
        user = UserService.create_or_fetch_user(params)
        user_exam = find(user, exam) if user.present? && exam.present?
        errors << "College not found" if college.nil?
        errors << "Exam not found for the college" if exam.nil?
        errors << "Ivalid User" if user.nil?
        errors << "Exam is already assigned to the user" if user_exam.present?
        errors << "Exam does not fall under exam time window" if user_exam.nil? && is_valid_college_and_exam?(college, exam, params[:start_time])
        [user, exam, errors]
    end

    def self.is_start_time_in_exam_window(exam, start_time)
        (start_time > exam.exam_window.start_time) && (start_time < exam.exam_window.end_time)
    end

    def self.is_valid_college_and_exam?(college, exam, start_time)
        college.present? && exam.present? && !is_start_time_in_exam_window(exam, start_time)
    end

    def self.find(user, exam)
        UserExam.find_by(user_id: user.id, exam_id: exam.id)
    end
end