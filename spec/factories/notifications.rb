FactoryGirl.define do
  factory :notification do
    association :user
    association :snap
    association :notified_by
    notice_type "comment"
    read        false

    trait :read do
      read true
    end
  end
end