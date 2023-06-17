json.extract! user_workout, :id, :user_id, :workout_id, :created_at, :updated_at
json.url user_workout_url(user_workout, format: :json)
