# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Exercise.create(name: "Bench Press")
Exercise.create(name: "Biceps Curl")
Exercise.create(name: "Triceps Extension")
Exercise.create(name: "Shoulder Press")
Exercise.create(name: "Squat")
Exercise.create(name: "Deadlift")

(1..10).each { |i|
  Workout.create(created_at: Date.today - (10 - i))
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 1, workout_id: i)

  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
  ExerciseSet.create(reps: (rand(6) + 6).round, weight: (rand(5) + 30 + i), exercise_id: 3, workout_id: i)
}