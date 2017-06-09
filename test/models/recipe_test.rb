require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "recipe is valid" do
    recipe = Recipe.new(name: "SOMEONE", summary: "Something Else", 
        description: "Something Else", prep_times: "90", servings_made: "3")
    assert recipe.valid?, 'recipe is not valid'
  end
  
  test "recipe should be invalid without description" do
    recipe = Recipe.new(name: "Something", summary: "Something Else")
    assert recipe.invalid?, 'recipe should be invalid, but passed validation'
  end
  
  test "recipe should be invalid without summary" do
    recipe = Recipe.new(name: "Something", description: "Something Else")
    assert recipe.invalid?, 'recipe should be invalid, but passed validation'
  end
  
  test "recipe should be invalid without name" do
    recipe = Recipe.new(summary: "Something Else", description: "Something Else")
    assert recipe.invalid?, 'recipe should be invalid, but passed validation'
  end
  
  test "recipe should be invalid without preptime" do
    recipe = Recipe.new(name: "Something new", summary: "Something Else", 
      description: "Something Else", servings_made: "3")
    assert recipe.invalid?, 'recipe should be invalid - missing prep_times, but passed validation'
  end
  
  test "recipe should be invalid without servings_made" do
    recipe = Recipe.new(name: "SOMEONE", summary: "Something Else", 
      description: "Something Else", prep_times: "Something")
    refute recipe.valid?, 'recipe should be invalid - missing servings_made, but passed validation'
  end
end
