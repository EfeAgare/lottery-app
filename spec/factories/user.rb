FactoryBot.define do
  factory :user do
    created_at { Time.zone.now }
  end
end