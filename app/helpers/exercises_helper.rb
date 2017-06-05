module ExercisesHelper
  
  def exercise_owner?
    owner_check(@exercises.user_id)
  end

end