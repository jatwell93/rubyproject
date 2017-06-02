require 'test_helper'

class IngredientControllerTest < ActionController::TestCase
  test "should get name:string" do
    get :name:string
    assert_response :success
  end

  test "should get recipe_id:integer" do
    get :recipe_id:integer
    assert_response :success
  end

end
