class UsersController < ApplicationController 
   before_action :require_same_user, only: [:edit, :update]
   before_action :set_user, only: [:show, :edit, :update, :destroy, :finish_signup]
   
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  # GET /users/:id.:format
  def show
    @recipes = @user.recipes.paginate(page: params[:page], per_page: 3)
    @workouts = @user.workouts.paginate(page: params[:page], per_page: 3)
    #@workout = Workout.find(params[:id])
    @random_workout = Workout.where.not(id: @workout).order("RANDOM()").first(3)
    @exercise = current_user.exercises.find(params[:id])
    @exercises = current_user.exercises.all
    @friends = current_user.friends
  end

  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user 
    if request.patch? && params[:user] #&& params[:user][:email]
      if @user.update(user_params)
        #@user.skip_reconfirmation!
        @user.skip_reconfirmation! if @user.respond_to?(:skip_reconfirmation)
        sign_in(@user, :bypass => true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end