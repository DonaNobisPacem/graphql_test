require 'rails_helper'

RSpec.describe Schema, type: :schema do
  # You can override `context` or `variables` in
  # more specific scopes
  let(:context) { {} }
  let(:variables) { {} }
  # Call `result` to execute the query

  def result(mutation_string)
    res = Schema.execute(
      mutation_string,
      context: context,
      variables: variables
    )
    # Print any errors
    if res["errors"]
      pp res
    end
    res
  end

  describe "hero mutations queries" do

    it "creates a new hero and returns a status and the new hero" do
      mutation_string = "mutation { createHero( input: {name: \"RSpec Hero Mutation New\", attribute: \"STR\"} ){ status hero{ name attribute } } }"
      output = result(mutation_string)
      #pp output
      status = output["data"]["createHero"]["status"]
      hero = output["data"]["createHero"]["hero"]

      expect(status).to eq("Hero has been created")
      expect(hero["name"]).to eq("RSpec Hero Mutation New")
    end

    it "destroy an existing hero" do
      10.times { FactoryGirl.create(:hero) }
      init_hero_count = Hero.count
      mutation_string = "mutation { destroyHero( input: {id: #{Hero.last.id}} ){ status } }"
      output = result(mutation_string)
      pp output
      status = output["data"]["destroyHero"]["status"]
      #hero = output["data"]["createHero"]["hero"]

      expect(status).to eq("Hero has been destroyed. Hero count is now #{Hero.count}")
      expect(init_hero_count).to eq(Hero.count + 1)
      #expect(hero["name"]).to eq("RSpec Hero Mutation New")
    end
  end
end
