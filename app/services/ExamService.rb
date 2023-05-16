class ExamService

    def self.exam_in_college(college, params)
        college.exams.find_by(id: params[:exam_id]) if college.present?
    end
end