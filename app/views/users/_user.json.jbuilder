json.extract! user, :id, :name, :age, :username, :password, :mobile_number, :created_at, :updated_at
json.url user_url(user, format: :json)
