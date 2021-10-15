FactoryBot.define do
  factory :lottery_draw do
    created_at { Time.zone.now }
  end
end