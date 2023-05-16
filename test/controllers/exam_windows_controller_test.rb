require "test_helper"

class ExamWindowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exam_window = exam_windows(:one)
  end

  test "should get index" do
    get exam_windows_url, as: :json
    assert_response :success
  end

  test "should create exam_window" do
    assert_difference("ExamWindow.count") do
      post exam_windows_url, params: { exam_window: { end_time: @exam_window.end_time, start_time: @exam_window.start_time } }, as: :json
    end

    assert_response :created
  end

  test "should show exam_window" do
    get exam_window_url(@exam_window), as: :json
    assert_response :success
  end

  test "should update exam_window" do
    patch exam_window_url(@exam_window), params: { exam_window: { end_time: @exam_window.end_time, start_time: @exam_window.start_time } }, as: :json
    assert_response :success
  end

  test "should destroy exam_window" do
    assert_difference("ExamWindow.count", -1) do
      delete exam_window_url(@exam_window), as: :json
    end

    assert_response :no_content
  end
end
