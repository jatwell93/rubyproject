require 'test_helper'

# class RecipesControllerTest < ActionController::TestCase
class RecipesControllerTest <   ActionDispatch::IntegrationTest
  setup do
    # sign_in could be @user or users(:one) if we have fixtures
    @user = users(:one)
    sign_in @user
    # @recipe = recipes(:one)
  end



  test "should create recipe" do
    assert_difference('Recipe.count') do

      post recipes_url, params: { recipe: {name: 'Test Here' } }
    end

    assert_redirected_to recipe_path(Recipe.last)
  end
end