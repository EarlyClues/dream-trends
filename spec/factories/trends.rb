Factory.sequence(:trend_name) { |n| "Trend Name #{n}" }

FactoryGirl.define do

  factory :trend do
    word { Factory.next :trend_name }

    factory :excluded_trend do
      excluded true
    end
  end
end
