
FactoryGirl.define do
  factory :location, :class => Refinery::Locations::Location do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

