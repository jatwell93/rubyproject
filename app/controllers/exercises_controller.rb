class ExercisesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_exercise, except: [:index, :new, :create]
    set_tab :exercises
    
    def index 
      @exercises = current_user.exercises.all
      @friends = current_user.friends
    end
    
    def new
       @exercise = current_user.exercises.new
    end
    
    def create
      @exercise = current_user.exercises.new(exercise_params)
      
      if @exercise.save
        flash[:success] = "Exercise has been created"
        redirect_to [current_user, @exercise]
        
      else
        flash[:warning] = "Exercise has not been created"
        render :new
      end
    end
    
    def show
      @exercises = current_user.exercises.all
    end
    
    def edit
      
    end
    
    def update

      if @exercise.update(exercise_params)
        flash[:success] = "Exercise has been updated"
        redirect_to [current_user, @exercise]
        
      else
        flash[:warning] = "Exercise has not been updated"
        render :edit
      end
    end
    
    def destroy
      @exercise.destroy
      flash[:success] = "Exercise has been deleted"
      redirect_to user_exercises_path(current_user)
    end
    
    private
      
      def exercise_params
        params.require(:exercise).permit(:duration_in_min, :workout, :rating, :workout_date, :user_id, movements_attributes: [:id, :name, :_destroy], reps_attributes: [:id, :amount, :_destroy], zets_attributes: [:id, :quantity, :_destroy], weights_attributes: [:id, :kilogram, :_destroy],)
      end
      
      def set_exercise
        @exercise = current_user.exercises.find(params[:id])
      end
end
