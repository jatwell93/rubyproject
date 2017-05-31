require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "recipe is valid" do
    recipe = recipes(:one)
    assert recipe.invalid?, 'recipe is not valid'
  end
  
end
