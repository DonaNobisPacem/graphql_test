FactoryGirl.define do
  factory :hero do
    name {FFaker::Name.name}
    main_attr {FFaker::Color.name}
    skill1 {FFaker::Company.name}
    skill2 {FFaker::Company.name}
    skill3 {FFaker::Company.name}
    skill4 {FFaker::Company.name}
    str {rand(1..100)}
    agi {rand(1..100)}
    int {rand(1..100)}
  end
end
