module RecipesHelper
  
  def recipe_owner?
    # calls check against application_helper
    owner_check(@recipe.user_id)
  end

end