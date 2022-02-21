json.extract! user, :id, :name, :email, :password_digest, :dish_id, :venue_id,
              :created_at, :updated_at
json.url user_url(user, format: :json)
