# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do 
  FactoryGirl.create(:item)
end

100.times do 
  hero = FactoryGirl.create(:hero, main_attr: ["STR", "AGI", "INT"].sample)
  6.times do
    item = Item.order("RANDOM()").first
    hero.itemizations << FactoryGirl.create(:itemization, hero: hero, item: item)
    #hero.categorizations.create()
  end
  hero.save!
end