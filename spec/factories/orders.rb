FactoryBot.define do
  factory :order do
    user
    sequence(:description) { |n| "Description #{n}" }
    sequence(:pay_method) { |n| "Pay method #{n}" }
  end
end
