FactoryBot.define do
  factory :user_lottery do
    created_at { Time.zone.now }
    user
  end
end