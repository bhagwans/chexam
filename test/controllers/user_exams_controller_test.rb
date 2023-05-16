require "test_helper"

class UserExamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_exam = user_exams(:one)
  end

  test "should get index" do
    get user_exams_url, as: :json
    assert_response :success
  end

  test "should create user_exam" do
    assert_difference("UserExam.count") do
      post user_exams_url, params: { user_exam: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show user_exam" do
    get user_exam_url(@user_exam), as: :json
    assert_response :success
  end

  test "should update user_exam" do
    patch user_exam_url(@user_exam), params: { user_exam: {  } }, as: :json
    assert_response :success
  end

  test "should destroy user_exam" do
    assert_difference("UserExam.count", -1) do
      delete user_exam_url(@user_exam), as: :json
    end

    assert_response :no_content
  end
end
