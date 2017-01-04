module Resolvers
  class Items
    def call(_, arguments, _)
      # if arguments[:id]
      #   ::Hero.find_by_id(arguments[:id])
      # elsif arguments[:attribute]
      #   ::Hero.where(main_attr: arguments[:attribute])
      # else
      #   ::Hero.all 
      # end

      #improved version
      items_from_arguments( arguments )
    end

    private

    def items_from_arguments( arguments = {} )
      %i(id hero_id).each do |resolution_strategy|
        if arguments[resolution_strategy].present?
          return send(resolution_strategy, arguments[resolution_strategy])
        end
      end

      ::Item.all
    end

    #resolution strategies from send 1st argument
    def id(id)
      #::Hero.find_by_id(id)
      ::Item.where(id: id)
    end

    def hero_id(hero_id)
      #::Item.where(id: Itemization.where(hero_id: hero_id).id)
      #::Item.joins(Itemization.all).where("item_id == ?", item_id)
      ::Hero.find_by_id(hero_id).items
    end
  end
end