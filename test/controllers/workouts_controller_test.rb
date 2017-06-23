require 'test_helper'

class WorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @workout = workouts(:one)
  end

  test "get index" do
    get '/workouts'
    assert_response :success
    assert_not_nil assigns(:workouts)
  end

  test "get new" do
    get new_workout_path
    assert_response :success
  end

  test "create workout" do
    assert_difference('Workout.count') do
      post workouts_url, workout: { id: 1,
        name: "CheeseBurger", summary: "SOMETHING SO COOL!!!", 
        user_id: 1 }
    end
    assert_redirected_to workout_url(Workout.last)
  end

  test "show workout" do
    get workouts_url(@workout)
    assert_response :success
  end

  test "get edit" do
    get edit_workout_url(@workout)
    assert_response :success
  end

  test "update workout" do
    patch workout_url(@workout), workout: { name: "The Turkey Push" }
    assert_redirected_to workout_path(assigns(:workout))
  end

  test "destroy workout if admin" do
    assert_difference('Workout.count', -1) do
      delete workout_url(@workout)
    end

    assert_redirected_to workouts_path
  end
  
end
