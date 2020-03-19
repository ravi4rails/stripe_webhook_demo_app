json.extract! user, :id, :email, :stripe_customer_token, :created_at, :updated_at
json.url user_url(user, format: :json)
