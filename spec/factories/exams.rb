FactoryBot.define do
    # Determine class automatically
    factory :exam do
      name { "Atria exam" }
      college_id {1}
      exam_window_id {1}
    end
end