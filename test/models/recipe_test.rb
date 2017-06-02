require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "recipe is valid" do
    recipe = Recipe.new(name: "SOMEONE", summary: "Something Else", description: "Something Else")
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
end
