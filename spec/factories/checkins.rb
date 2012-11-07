# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkin do
    user
    starting_at "2012-11-05 23:41:31"
    ending_at "2012-11-05 23:41:31"
    factory :current_checkin do
      starting_at { 1.hour.ago }
      ending_at { Time.now + 2.hours }
    end
  end
end
