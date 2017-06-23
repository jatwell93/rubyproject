require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  setup do
    @recipe = Recipe.new(name: "SOMEONE", summary: "Something Else", 
        description: "Something Else", prep_times: "90", servings_made: "3",
        feeds: "3", user_id: 1, calories: 5)
  end

  test "@recipe is valid" do
    assert @recipe.valid?, '@recipe is not valid'
  end

  test "@recipe should be invalid without name" do
    @recipe["name"] = ""
    assert @recipe.invalid?, '@recipe should be invalid without name, but passed validation'
  end
  
  test "@recipe should be invalid without summary" do
    @recipe["summary"] = ""
    assert @recipe.invalid?, '@recipe should be invalid without summary, but passed validation'
  end
    
  test "@recipe should be invalid without description" do
    @recipe["description"] = ""
    assert @recipe.invalid?, '@recipe should be invalid without description, but passed validation'
  end

  test "@recipe should be invalid without preptime" do
    @recipe["prep_times"] = ""
    assert @recipe.invalid?, '@recipe should be invalid - missing prep_times, but passed validation'
  end
  
  test "@recipe should be invalid without servings_made" do
    @recipe["servings_made"] = ""
    refute @recipe.valid?, '@recipe should be invalid - missing servings_made, but passed validation'
  end

  test "@recipe should be invalid without user_id" do
    @recipe["user_id"] = ""
    refute @recipe.valid?, '@recipe should be invalid - missing user_id, but passed validation'
  end
  
  test "@recipe should be invalid without calories" do
    @recipe["calories"] = ""
    refute @recipe.valid?, '@recipe should be invalid - missing calories, but passed validation'
  end
end
