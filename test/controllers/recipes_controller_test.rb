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
  
  test "should get new" do
    get new_recipe_url
    assert_response :success
  end

  test "should show recipe" do
    @recipe = recipes(:one)
    get recipe_url(@recipe)
    assert_response :success
  end
  
  test "should get edit" do
    @recipe = recipes(:one)
    get edit_recipe_url(@recipe)
    assert_response :success
  end
  
  test "should update recipe" do
    sign_in @user
  @recipe = recipes(:one)

    patch recipe_url(@recipe), recipe: {
      name: "This is a name",
      summary: @recipe.summary, 
      description: @recipe.description, 
      prep_times: @recipe.prep_times, 
      servings_made: @recipe.servings_made,
      feeds: 3,
      user_id: 1
      } 
    assert_redirected_to recipe_url(@recipe)
    
  end
end