module WorkoutsHelper
  
  def workout_owner?
    owner_check(@workout.user_id)
  end

end