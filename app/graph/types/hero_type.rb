HeroType = GraphQL::ObjectType.define do
  name 'Hero'
  description 'Annihilator of Creeps'

  field :id, !types.ID
  field :name, !types.String
  field :attribute, !types.String, property: :main_attr #, 'Main Hero Attribute'
  field :skill1, !types.String, 'Q Skill'
  field :skill2, !types.String, 'W Skill'
  field :skill3, !types.String, 'E Skill'
  field :skill4, !types.String, 'R Skill'
  field :str, !types.Int, 'Strength Points'
  field :agi, !types.Int, 'Agility Points'
  field :int, !types.Int, 'Intelligence Points'

  field :items, -> {types[ItemType]}, "Something to spend gold on"
  field :item do 
    type types[ItemType]
    argument :slot, !types.Int
    resolve -> (obj, args, ctx) {
      obj.items.limit(1).offset( args[:slot] - 1 )
    }
  end
end