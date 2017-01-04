require 'rails_helper'

RSpec.describe Schema, type: :schema do
  # You can override `context` or `variables` in
  # more specific scopes
  let(:context) { {} }
  let(:variables) { {} }
  # Call `result` to execute the query

  def result(query_string)
    res = Schema.execute(
      query_string,
      context: context,
      variables: variables
    )
    # Print any errors
    if res["errors"]
      pp res
    end
    res
  end

  before(:each) do 
    10.times do |count|
      FactoryGirl.create(:item, name: "Rspec Item #{count}")
    end

    15.times do |count|
      hero = FactoryGirl.create(:hero, name: "Rspec Hero #{count}", main_attr: ["STR", "DEX", "INT"].sample)
      3.times do 
        item = Item.order("RANDOM()").first
        hero.itemizations << FactoryGirl.create(:itemization, hero: hero, item: item)
      end
      hero.save
    end
  end

  describe "a specific hero query" do
    # provide a query string for `result`
    #let(:query_string) { %|{ heroes { name } }| }

    context "when there's no existing hero" do
      it "is nil" do
        # calling `result` executes the query
        Hero.destroy_all
        query_string = "{ heroes { name } }"
        output = result(query_string)
        expect(output["data"]["heroes"]).to eq([])
      end
    end

    context "when there exists a hero" do
      

      describe "queries concerning a single hero specified by id" do
        # let(:query_string) { %|{ hero(id: #{Hero.first.id}) { name } }| } 
        it "shows the selected hero's name" do
          query_string = "{ hero(id: #{Hero.first.id}) { name } }"
          output = result(query_string)
          hero = output["data"]["hero"]
          hero_name = hero["name"]
          expect(hero_name).to eq("#{Hero.first.name}")
        end
      end

      describe "queries concerning a multiple heroes" do 
        context "when there are no arguments provided" do
          it "provides the list of every hero" do
            #let(:query_string) { %|{ heroes { name } }| }
            query_string = "{ heroes { name attribute } }"
            output = result(query_string)
            heroes = output["data"]["heroes"]
            expect(heroes.size).to eq(Hero.count)
          end

          it "provides access to hero fields" do
            #let(:query_string) { %|{ heroes { name } }| }
            query_string = "{ heroes { name attribute } }"
            output = result(query_string)
            heroes = output["data"]["heroes"]
            hero = heroes[0]
            expect(hero["name"]).to eq(Hero.first.name)
          end
        end

        context "when attribute is provided as argument" do
          it "provides a list of heroes of specified attribute" do
            query_string = "{ heroes(attribute: \"STR\") { name attribute } }"
            output = result(query_string)
            heroes = output["data"]["heroes"]
            expect(heroes.size).to eq(Hero.where(main_attr: "STR").count)
          end

          it "provides access to hero fields" do
            #let(:query_string) { %|{ heroes { name } }| }
            query_string = "{ heroes(attribute: \"STR\") { name attribute } }"
            output = result(query_string)
            heroes = output["data"]["heroes"]
            hero = heroes[0]
            expect(hero["name"]).to eq(Hero.where(main_attr: "STR").first.name)
          end
        end

        context "when item_id is provided as argument" do
          it "provides a list of heroes of with specified item" do
            query_string = "{ heroes(item_id: #{Item.first.id}) { name } }"
            output = result(query_string)

            pp output
            pp Itemization.where(item_id: Item.first.id).group(:hero_id).count
            
            heroes = output["data"]["heroes"]
            expect(heroes.size).to eq(Itemization.where(item_id: Item.first.id).group(:hero_id).count.count)
          end

          it "provides access to hero fields" do
            #let(:query_string) { %|{ heroes { name } }| }
            query_string = "{ heroes(item_id: #{Item.first.id}) { name } }"
            output = result(query_string)
            heroes = output["data"]["heroes"]
            hero = heroes[0]
            expect(hero["name"]).to eq(Hero.joins(:itemizations).where("itemizations.item_id == ?", Item.first.id).first.name)
          end
        end
      end
    end
  end
end
