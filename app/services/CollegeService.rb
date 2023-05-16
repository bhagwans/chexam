class CollegeService

    def self.college(params)
        College.find_by(id: params[:college_id])
    end
end