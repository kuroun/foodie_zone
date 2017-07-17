json.extract! restaurant, :id, :name, :address, :restaurant_owner_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
