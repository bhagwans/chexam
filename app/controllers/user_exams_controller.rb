class UserExamsController < ApplicationController
  before_action :set_user_exam, only: %i[ show update destroy ]

  # GET /user_exams
  # GET /user_exams.json
  def index
    @user_exams = UserExam.all
  end

  # GET /user_exams/1
  # GET /user_exams/1.json
  def show
  end

  # POST /user_exams
  # POST /user_exams.json
  def create
    user, exam, errors = UserExamService.validate_user_exam_data(user_exam_params)
    if errors.empty?
      @user_exam = UserExam.new(build_user_exam_params(user, exam, user_exam_params))

      if @user_exam.save
        render json: @user_exam, status: :created
      else
        render json: @user_exam.errors, status: :unprocessable_entity
      end
    else
      render json: { message: errors.join(",") }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_exams/1
  # PATCH/PUT /user_exams/1.json
  def update
    if @user_exam.update(user_exam_params)
      render :show, status: :ok, location: @user_exam
    else
      render json: @user_exam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_exams/1
  # DELETE /user_exams/1.json
  def destroy
    @user_exam.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_exam
      @user_exam = UserExam.find(params[:id])
    end

    def set_user
      @user = User.find_by(phone_number: user_exam_params[:phone_number])
    end
    
    def build_user_exam_params(user, exam, params)
      { user_id: user.id, exam_id: exam.id, start_time: params[:start_time] }
    end

    # Only allow a list of trusted parameters through.
    def user_exam_params
      params.require(:user_exam).permit(:college_id, :exam_id, :first_name, :last_name, :start_time, :phone_number)
    end
end
