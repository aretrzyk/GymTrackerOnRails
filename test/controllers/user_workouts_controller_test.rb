require "test_helper"

class UserWorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_workout = user_workouts(:one)
  end

  test "should get index" do
    get user_workouts_url
    assert_response :success
  end

  test "should get new" do
    get new_user_workout_url
    assert_response :success
  end

  test "should create user_workout" do
    assert_difference("UserWorkout.count") do
      post user_workouts_url, params: { user_workout: { user_id: @user_workout.user_id, workout_id: @user_workout.workout_id } }
    end

    assert_redirected_to user_workout_url(UserWorkout.last)
  end

  test "should show user_workout" do
    get user_workout_url(@user_workout)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_workout_url(@user_workout)
    assert_response :success
  end

  test "should update user_workout" do
    patch user_workout_url(@user_workout), params: { user_workout: { user_id: @user_workout.user_id, workout_id: @user_workout.workout_id } }
    assert_redirected_to user_workout_url(@user_workout)
  end

  test "should destroy user_workout" do
    assert_difference("UserWorkout.count", -1) do
      delete user_workout_url(@user_workout)
    end

    assert_redirected_to user_workouts_url
  end
end
