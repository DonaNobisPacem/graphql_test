QueryType = GraphQL::ObjectType.define do
  name 'Query'
  description 'The root of all queries'

  field :hero do 
    type HeroType
    description 'Select Hero based on ID'
    argument :id, types.ID, "Hero ID"
    resolve -> (obj, args, ctx) { Hero.find_by_id(args[:id]) }
  end

  field :heroes do
    type types[HeroType]
    description 'Select Hero based on arguments, select all no arguments found'
    argument :id, types.ID, "Hero ID"
    argument :item_id, types.ID, "Heroes that hold items with selected ID"
    argument :attribute, types.String, "Hero Main Attribute"
    resolve Resolvers::Heros.new
  end


  field :item do 
    type ItemType
    description 'Select Item based on ID'
    argument :id, types.ID, "Item ID"
    resolve -> (obj, args, ctx) { Item.find_by_id(args[:id]) }
  end

  field :items do 
    type types[ItemType]
    description 'Select item based on arguments, select all no arguments found'
    argument :id, types.ID, "Item ID"
    argument :hero_id, types.ID, "Items that are owned by Hero with selected ID"
    #argument :attribute, types.String, "Hero Main Attribute"
    resolve Resolvers::Items.new
  end
end