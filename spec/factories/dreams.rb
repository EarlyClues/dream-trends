Factory.sequence(:title_name) { |n| "Dream Title #{n}" }
Factory.sequence(:body_text) { |n| "Dream Body #{n}" }
Factory.sequence(:dream_date) { |n| n.weeks.ago }

FactoryGirl.define do
  factory :dream do
    title { Factory.next :title_name }
    body { Factory.next :body_text }
    dream_date { Factory.next :dream_date }
  end
end
