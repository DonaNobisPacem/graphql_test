module Resolvers
  class Heros
    def call(_, arguments, _)
      # if arguments[:id]
      #   ::Hero.find_by_id(arguments[:id])
      # elsif arguments[:attribute]
      #   ::Hero.where(main_attr: arguments[:attribute])
      # else
      #   ::Hero.all 
      # end

      #improved version
      heros_from_arguments( arguments )
    end

    private

    def heros_from_arguments( arguments = {} )
      %i(id attribute item_id).each do |resolution_strategy|
        if arguments[resolution_strategy].present?
          return send(resolution_strategy, arguments[resolution_strategy])
        end
      end

      ::Hero.all
    end

    #resolution strategies from send 1st argument
    def id(id)
      #::Hero.find_by_id(id)
      ::Hero.where(id: id)
    end

    def attribute(attribute)
      ::Hero.where(main_attr: attribute)
    end

    def item_id(item_id)
      ::Hero.joins(:itemizations).where("item_id == ?", item_id)
    end
  end
end