module RecipesHelper
  
  def recipe_owner?
    owner_check(@recipe.user_id)
  end

end