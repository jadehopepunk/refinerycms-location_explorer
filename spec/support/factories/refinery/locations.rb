
FactoryGirl.define do
  factory :location, :class => Refinery::LocationExplorer::Location do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

