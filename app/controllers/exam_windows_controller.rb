class ExamWindowsController < ApplicationController
  before_action :set_exam_window, only: %i[ show update destroy ]

  # GET /exam_windows
  # GET /exam_windows.json
  def index
    @exam_windows = ExamWindow.all
  end

  # GET /exam_windows/1
  # GET /exam_windows/1.json
  def show
  end

  # POST /exam_windows
  # POST /exam_windows.json
  def create
    @exam_window = ExamWindow.new(exam_window_params)

    if @exam_window.save
      render :show, status: :created, location: @exam_window
    else
      render json: @exam_window.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exam_windows/1
  # PATCH/PUT /exam_windows/1.json
  def update
    if @exam_window.update(exam_window_params)
      render :show, status: :ok, location: @exam_window
    else
      render json: @exam_window.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exam_windows/1
  # DELETE /exam_windows/1.json
  def destroy
    @exam_window.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_window
      @exam_window = ExamWindow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_window_params
      params.require(:exam_window).permit(:start_time, :end_time)
    end
end
