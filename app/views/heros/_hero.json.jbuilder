json.extract! hero, :id, :name, :main_attr, :skill1, :skill2, :skill3, :skill4, :str, :agi, :int, :created_at, :updated_at
json.url hero_url(hero, format: :json)