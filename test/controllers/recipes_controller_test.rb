require 'test_helper'

# class RecipesControllerTest < ActionController::TestCase
class RecipesControllerTest <   ActionDispatch::IntegrationTest
  setup do
    @user = User.new(username: "MYSTRING", email: "Myemail@email.com", admin: true)
    sign_in @user
  end

  test "should get index" do
    get '/recipes'
    assert_response :success
  end
  
  test "should create recipe" do
    assert_difference('Recipe.count') do

      post recipes_url, params: { recipe: { name: "SOMEONE", summary: "Something Else", 
        description: "Something Else", prep_times: "90", servings_made: "3", user_id: "1"} }
    end

    assert_redirected_to recipe_path(Recipe.last)
  end
end