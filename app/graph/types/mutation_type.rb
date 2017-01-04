MutationType = GraphQL::ObjectType.define do
  name 'Mutation'
  description 'Modifier of Database'

  field :createHero, field: HeroMutations::Create.field
  #field :editHero, field: HeroMutations::Edit.field
  field :destroyHero, field: HeroMutations::Destroy.field

  #field :createItem, field: ItemMutations::Create.field
  #field :editItem, field: ItemMutations::Edit.field
  #field :destroyItem, field: ItemMutations::Destroy.field
end

