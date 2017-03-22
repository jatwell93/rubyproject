module RecipesHelper
    def is_owner?
      if current_user.id == @recipe.chef_id then
          return true
      else
          return false
      end
    end
end