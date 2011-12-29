FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end
FactoryGirl.define do
  factory :client do
    email
    password "anything"
  end
  factory :worker do
    email
    password "anything"
  end
  factory :work do
    content "original text"
  end
  factory :task do
    content "translated text"
  end
end

