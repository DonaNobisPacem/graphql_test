json.extract! item, :id, :name, :cost, :hero_id, :created_at, :updated_at
json.url item_url(item, format: :json)