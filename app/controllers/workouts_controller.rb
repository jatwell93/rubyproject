class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update, :show, :like, :review, :destroy]
  before_action :authenticate_user!, except: [:show,  :like, :search]
  before_action :require_same_user, only: [:edit, :update]
  # before_action :admin_user, only: :destroy
  set_tab :workouts
  
  def index
    @workouts = Workout.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @random_workout = Workout.where.not(id: @workout).order("RANDOM()").first(3)
    @athletes = User.paginate(:page => params[:page])
  end
  
  def new
    @workout = Workout.new
  end
  
  def create
    @workout = Workout.new(workout_params)
    @workout.user_id = current_user.id
    
    if @workout.save
      flash[:success] = "Your workout was created successfully!"
      redirect_to workout_url(@workout)
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
    flash[:success] = "Workout was deleted."
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
  
  def like 
    like = Like.create(like: params[:like], user: current_user, workout: @workout)
    if like.valid?
      flash[:success] = "Your selection was successful"
      redirect_to :back
    else
      flash[:danger] = "#{current_user.username} " + 'you can only like/dislike once per item.'
      redirect_to :back
    end
  end
  
  private
    
    def workout_params
      params.require(:workout).permit(:name, :summary, :attachment, :user_id, 
        movements_attributes: [:id, :name, :_destroy], 
        reps_attributes: [:id, :amount, :_destroy], 
        zets_attributes: [:id, :quantity, :_destroy], 
        weights_attributes: [:id, :kilogram, :_destroy],)
    end
    
    def set_workout
      @workout = Workout.find(params[:id])
    end
    
    def require_same_user
      if current_user != @workout.user and !current_user.admin?
        # flash[:danger] = "You can only edit your own recipes"
        # redirect_to recipes_path
      end
    end
  
    def admin_user
      # puts "Current user ... #{current_user.admin?}"
      # redirect_to workouts_path unless current_user.admin?
    end

end