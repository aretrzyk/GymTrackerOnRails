require "application_system_test_case"

class UserWorkoutsTest < ApplicationSystemTestCase
  setup do
    @user_workout = user_workouts(:one)
  end

  test "visiting the index" do
    visit user_workouts_url
    assert_selector "h1", text: "User workouts"
  end

  test "should create user workout" do
    visit user_workouts_url
    click_on "New user workout"

    fill_in "User", with: @user_workout.user_id
    fill_in "Workout", with: @user_workout.workout_id
    click_on "Create User workout"

    assert_text "User workout was successfully created"
    click_on "Back"
  end

  test "should update User workout" do
    visit user_workout_url(@user_workout)
    click_on "Edit this user workout", match: :first

    fill_in "User", with: @user_workout.user_id
    fill_in "Workout", with: @user_workout.workout_id
    click_on "Update User workout"

    assert_text "User workout was successfully updated"
    click_on "Back"
  end

  test "should destroy User workout" do
    visit user_workout_url(@user_workout)
    click_on "Destroy this user workout", match: :first

    assert_text "User workout was successfully destroyed"
  end
end
