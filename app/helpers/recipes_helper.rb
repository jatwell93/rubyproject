module RecipesHelper
  def is_owner?
    if current_user.id == @recipe.user_id then
        return true
    else
        return false
    end
  end
  
  def user?(user)
    return true unless user.nil? 
  end
  
end