FactoryGirl.define do
  factory :itemization do
    hero {create(:hero)}
    item {create(:item)}
  end
end
