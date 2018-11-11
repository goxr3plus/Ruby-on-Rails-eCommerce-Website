FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "Abhishek #{n}" }
    sequence(:email) {|n| "abhi#{n}@gyt.com" }
    sequence(:password) {|n| "abhi.new#{n}" }
    password_confirmation { password}
  end
end
