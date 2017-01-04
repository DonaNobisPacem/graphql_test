module HeroMutations
  Create = GraphQL::Relay::Mutation.define do 
    name "Create Hero"
    description "How heroes are made."

    input_field :name, !types.String
    input_field :attribute, !types.String
    # input_field :str, types.Int
    # input_field :agi, types.Int
    # input_field :int, types.Int
    # input_field :skill1, types.String
    # input_field :skill2, types.String
    # input_field :skill3, types.String
    # input_field :skill4, types.String

    return_field :status, types.String
    return_field :hero, HeroType

    resolve -> ( obj, inputs, ctx ) {
      hero = Hero.create(name: inputs[:name], main_attr: inputs[:attribute])
      { 
        status: "Good",
        hero: hero 
      }
    }
  end


  Destroy = GraphQL::Relay::Mutation.define do 
    name "Destroy Hero"
    description "How heroes die."

    input_field :id, !types.ID

    return_field :status, types.String

    resolve -> ( obj, inputs, ctx ) {
      hero = Hero.find_by_id(inputs[:id])
      hero.destroy
      { status: "Hero has been destroyed. Hero count is now #{Hero.count}" }
    }
  end
end