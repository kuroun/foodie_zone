json.extract! user, :id, :name, :type, :auth_token, :created_at, :updated_at
json.url user_url(user, format: :json)
