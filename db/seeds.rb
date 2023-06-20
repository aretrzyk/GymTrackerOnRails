# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "arek@gmail.com", password: "123")

Exercise.create(user_id: 1, name: "Bench Press")
Exercise.create(user_id: 1,name: "Biceps Curl")
Exercise.create(user_id: 1,name: "Triceps Extension")
Exercise.create(user_id: 1,name: "Shoulder Press")
Exercise.create(user_id: 1,name: "Squat")
Exercise.create(user_id: 1,name: "Deadlift")

(1..10).each { |i|
  Workout.create(user_id: 1, created_at: Date.today - (10 - i))
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)

  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
}