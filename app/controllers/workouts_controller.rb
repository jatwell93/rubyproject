class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update, :show, :like, :review]
  before_action :authenticate_user!, except: [:show, :index, :like, :search]
  before_action :require_same_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
   
    @athletes = User.paginate(:page => params[:page])
    @workouts = Workout.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @random_workout = Workout.where.not(id: @workout).order("RANDOM()").first(3)
  end
  
  def new
    @workout = Workout.new
  end
  
  def create
    @workout = Workout.new(workout_params)
    @workout.user = current_user
    
    if @workout.save
      flash[:success] = "Your workout was created successfully!"
      redirect_to workouts_path
    else
      render :new
    end
  end
  
  def review
    review = Review.create(body: params[:body], user: current_user, workout: @workout)
    if review.valid?
      flash[:success] = "Thank you for reviewing this workout"
    else
      flash[:danger] = "Review failed to post"
    end
    redirect_to :back
  end
  
  def deletereview
    Review.find(params[:revid]).destroy
    flash[:success] = "Review deleted"
    redirect_to :back
  end
  
  def edit
    
  end
  
  def update
    if @workout.update(workout_params)
      flash[:success] = "Your workout was update success"
      redirect_to workout_path(@workout)
    else
      render :edit
    end
  end
  
  def destroy
    Workout.find(params[:id]).destroy
    flash[:success] = "Workout Deleted"
    redirect_to workouts_path
  end
  
  def review
    review = Review.create(body: params[:body], user: current_user, workout: @workout)
    if review.valid?
      flash[:success] = "Thank you for reviewing this workout"
    else
      flash[:danger] = "Review failed to post"
    end
    redirect_to :back
  end
  
  def deletereview
    Review.find(params[:revid]).destroy
    flash[:success] = "Review deleted"
    redirect_to :back
  end
  
  private
    
    def workout_params
        params.require(:workout).permit(:name, :summary, :attachment, :user_id, movements_attributes: [:id, :name, :_destroy], reps_attributes: [:id, :amount, :_destroy], zets_attributes: [:id, :quantity, :_destroy], weights_attributes: [:id, :kilogram, :_destroy],)
    end
    
    def set_workout
      @workout = Workout.find(params[:id])
    end
    
    def require_same_user
      if current_user != @workout.user and !current_user.admin?
        flash[:danger] = "You can only edit your own recipes"
        redirect_to recipes_path
      end
    end

    
    def admin_user
      redirect_to workouts_path unless current_user.admin?
    end
  
end