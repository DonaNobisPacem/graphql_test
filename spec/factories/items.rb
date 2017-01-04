FactoryGirl.define do
  factory :item do
    name {FFaker::Music.song}
    cost {rand(100..10000)}
    #hero {create(:hero)}
  end
end
