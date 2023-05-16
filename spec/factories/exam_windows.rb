FactoryBot.define do
    # Determine class automatically
    factory :exam_window do
      start_time { Time.now }
      end_time { Time.now + 4.hours }
    end
end