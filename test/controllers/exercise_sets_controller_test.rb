require "test_helper"

class ExerciseSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_set = exercise_sets(:one)
  end

  test "should get index" do
    get exercise_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_set_url
    assert_response :success
  end

  test "should create exercise_set" do
    assert_difference("ExerciseSet.count") do
      post exercise_sets_url, params: { exercise_set: { exercise_id: @exercise_set.exercise_id, reps: @exercise_set.reps, sets: @exercise_set.sets, weight: @exercise_set.weight, workout_id: @exercise_set.workout_id } }
    end

    assert_redirected_to exercise_set_url(ExerciseSet.last)
  end

  test "should show exercise_set" do
    get exercise_set_url(@exercise_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_set_url(@exercise_set)
    assert_response :success
  end

  test "should update exercise_set" do
    patch exercise_set_url(@exercise_set), params: { exercise_set: { exercise_id: @exercise_set.exercise_id, reps: @exercise_set.reps, sets: @exercise_set.sets, weight: @exercise_set.weight, workout_id: @exercise_set.workout_id } }
    assert_redirected_to exercise_set_url(@exercise_set)
  end

  test "should destroy exercise_set" do
    assert_difference("ExerciseSet.count", -1) do
      delete exercise_set_url(@exercise_set)
    end

    assert_redirected_to exercise_sets_url
  end
end
