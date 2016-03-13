FactoryGirl.define do
  sequence(:username) { |n| "user-#{n}" }

  factory :user, :aliases => [:notified_by] do
    email { |_u| "#{FactoryGirl.generate(:username)}@example.com" }
    sequence(:username)   { |n| "user-#{n}" }
    password              'password'
    password_confirmation 'password'
  end

end
