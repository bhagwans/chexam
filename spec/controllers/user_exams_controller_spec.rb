require 'rails_helper'

RSpec.describe UserExamsController, type: :controller do
    context "#create User Exam OR Assign exam to user" do
        context "Assign exam to user with valid data" do
            context "When exam not in exam window" do
                let(:college) { create(:college) }
                let(:exam_window) { create(:exam_window) }
                let(:exam) { create(:exam, college_id: college.id, exam_window_id: exam_window.id) }
                let(:params) { { user_exam: {first_name: "Bhagwan", last_name: "Suwarnkar", phone_number: "7899327413", college_id: college.id, exam_id: exam.id, start_time: Time.now.utc + 1.hour} } }
                before do
                    post :create, params: params
                end

                it "return 201" do
                    expect(response.status).to eq 201
                end
            end
        end

        context "Assign exam to user with invalid data" do
            context "When College and Exam not found" do
                let(:college) { create(:college) }
                let(:params) { { user_exam: {first_name: "Bhagwan", last_name: "Suwarnkar", phone_number: "7899327413", college_id: 1, exam_id: 1, start_time: Time.now} } }
                before do
                    post :create, params: params
                end

                it "return reponse with error" do
                    res = "College not found,Exam not found for the college"
                    expect(JSON.parse(response.body)["message"]).to eq res
                end

                it "return 422" do
                    expect(response.status).to eq 422
                end
            end

            context "When exam not found" do
                let(:college) { create(:college) }
                let(:params) { { user_exam: {first_name: "Bhagwan", last_name: "Suwarnkar", phone_number: "7899327413", college_id: college.id, exam_id: 1, start_time: Time.now} } }
                before do
                    post :create, params: params
                end

                it "return reponse with error" do
                    res = "Exam not found for the college"
                    expect(JSON.parse(response.body)["message"]).to eq res
                end

                it "return 422" do
                    expect(response.status).to eq 422
                end
            end

            context "When exam not in exam window" do
                let(:college) { create(:college) }
                let(:exam_window) { create(:exam_window) }
                let(:exam) { create(:exam, college_id: college.id, exam_window_id: exam_window.id) }
                let(:params) { { user_exam: {first_name: "Bhagwan", last_name: "Suwarnkar", phone_number: "7899327413", college_id: college.id, exam_id: exam.id, start_time: Time.now.utc - 1.hour} } }
                before do
                    post :create, params: params
                end

                it "return reponse with error" do
                    res = "Exam does not fall under exam time window"
                    expect(JSON.parse(response.body)["message"]).to eq res
                end

                it "return 422" do
                    expect(response.status).to eq 422
                end
            end
        end
    end
end