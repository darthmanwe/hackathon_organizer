FactoryBot.define do
  factory :edition do
    title { "Edition #{Time.now.to_s}" }
    registration_start_date { Time.now  - 2.days }
    start_date { Time.now }
    end_date { registration_starts_at + 2.days }
  end
end
