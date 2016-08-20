require "test_helper"

class RecipeTest < ActiveSupport::TestCase

    def setup
        @recipe = Recipe.new(name: "Chicken Parma", summary: "this is a great dish", description: "get some chicken and cook it the way you like")
    end
    
    test "recipe should be valid" do
        assert @recipe.valid?
    end
    
    test "name should be present" do
        @recipe.name = " "
        assert_not @recipe.valid?
    end
    
end 
