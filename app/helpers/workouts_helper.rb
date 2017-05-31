module WorkoutsHelper
  
  def owner?
    # owner_check(@recipe.user_id)
    owner_check(@workout.user_id)
  end

end