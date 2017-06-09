require 'test_helper'

# class RecipesControllerTest < ActionController::TestCase
class RecipesControllerTest <   ActionDispatch::IntegrationTest
  setup do
    # sign_in could be @user or users(:one) if we have fixtures
    @user = users(:one)
    sign_in @user
    # @recipe = recipes(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   # assert_not_nil assigns(:recipes)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      #  This next line obviously will fail - since it's just taking an existing record
      # post :create, recipe: @recipe

      #  Bad request issue here...perhaps Rails 5 format in rails 4 app?
      # post :create, params: { recipe: { name: "SOMEONE", summary: "Something Else", 
      #   description: "Something Else", prep_times: "90", servings_made: "3"}}
      post recipes_url, params:  { recipe: {  name: "SOMEONE", summary: "Something Else", 
        description: "Something Else", prep_times: "90", servings_made: "3"} }

       ### Bad request after user load x2
      # post :create, params: { name: "SOMEONE", summary: "Something Else", 
      #   description: "Something Else", prep_times: "90", servings_made: "3"}

      ### Bad request after user load x2    
      # post :create, params: { name: "SOMEONE", summary: "Something Else", 
      #   description: "Something Else", prep_times: "90", servings_made: "3"}
    end
    # assert_redirected_to recipe_path(assigns(:recipe))

    assert_redirected_to recipe_path(@recipe)
  end

  # test "should show recipe" do
  #   get :show, id: @recipe
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @recipe
  #   assert_response :success
  # end

  # test "should update recipe" do
  #   patch :update, id: @recipe, recipe: @recipe
  #   assert_redirected_to recipe_path(assigns(:recipe))
  # end

  # test "should destroy recipe" do
  #   @recipe = Recipe.create!(name: "SOMEONE", summary: "Something Else", 
  #       description: "Something Else", prep_times: "90", servings_made: "3")
  #   assert_difference('Recipe.count', -1) do
  #     recipe_path(@recipe, method: :delete)
  #   end
    
  #   assert_redirected_to recipes_path
  # end
 
 
  # test "should destroy recipe" do
  #   @recipe = Recipe.create!(name: "SOMEONE", summary: "Something Else", 
  #       description: "Something Else", prep_times: "90", servings_made: "3")
  #   assert_difference('Recipe.count', -1) do
  #     puts "\n\nRecipe:  #{@recipe} -- User: #{@user.username}, #{@user.email}, #{@user.admin}\n\n"
  #     recipe_path(@recipe, method: :delete)
  #   end
    
  #   assert_redirected_to recipe_url
  # end 
  
end


  # test "should destroy country" do
  #   assert_difference('Country.count', -1) do
  #     delete country_url(@country)
  #   end

  #   assert_redirected_to countries_url
  # end