module RecipesHelper
  
  def owner?
    owner_check(@recipe.user_id)
  end

end