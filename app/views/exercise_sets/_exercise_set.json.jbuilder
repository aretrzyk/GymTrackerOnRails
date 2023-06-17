json.extract! exercise_set, :id, :exercise_id, :workout_id, :sets, :reps, :weight, :created_at, :updated_at
json.url exercise_set_url(exercise_set, format: :json)
