ItemType = GraphQL::ObjectType.define do
  name 'Item'
  description 'What a hero needs'

  field :id, !types.ID
  field :name, !types.String
  field :cost, !types.Int, 'Gold cost'
end