FactoryGirl.define do
  factory :shift do
    start 0.days.ago.beginning_of_day + 12.hours
    self.end 0.days.ago.beginning_of_day + 18.hours
    period :pm
    billing_rate :normal
    urgency :weekly
    notes 'Nobody wants to work this shift!'
    trait :with_restaurant do |restaurant|
      restaurant
    end
    trait :without_restaurant do
      restaurant_id 0
    end
  end
end