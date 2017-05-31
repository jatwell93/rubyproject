module RecipesHelper
  def is_owner?
    if current_user.id == @recipe.user_id then
        return true
    else
        return false
    end
  end
  
  def displayGravator?(user)
    link_to gravatar_for(user, size: 100), user_path(user) unless user.nil?
    
  end
  
end