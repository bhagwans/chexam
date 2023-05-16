class UserService

    def self.create_or_fetch_user(params)
        user = find(params)
        user.present? ? user : create_user(build_user_params(params))
    end

    def self.create_user(params)
        User.create(params)
    rescue
        nil
    end

    def self.build_user_params(params)
        { first_name: params[:first_name], last_name: params[:last_name], 
          phone_number: params[:phone_number], college_id: params[:college_id] }
    end

    def self.find(params)
        User.find_by(phone_number: params[:phone_number])
    end

end