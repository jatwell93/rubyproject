class RecipesController < ApplicationController
  include RecipesHelper
  before_action :set_user, except: [:index, :new]
  before_action :set_recipe, only: [:edit, :update, :show, :like, :review, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :like, :search]
  before_action :require_same_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def search
    if params[:search].present?
      @recipes = Recipe.search(params[:search])
    else
      @recipes = Recipe.all
    end

  end
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @random_recipe = Recipe.where.not(id: @recipe).order("RANDOM()").first(3)
  end
  
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.directions.build
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    
    # @recipe.user_id = current_user
    if @recipe.save
      flash[:success] = "Your recipe was created successfully!"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    
  end
  
  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was update success"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def like 
    like = Like.create(like: params[:like], user: @user, recipe: @recipe)
    if like.valid?
      flash[:success] = "Your like/dislike was noted successfully."
      redirect_to :back
    else
      flash[:danger] = "#{current_user.username.capitalize} you can only like/dislike once per item."
      redirect_to :back
    end
  end
  
  def destroy

    @recipe.destroy!
    flash[:success] = "Recipe Deleted"
    redirect_to recipes_path
  end
  
  def review
    review = Review.create(body: params[:body], user: @user, recipe: @recipe)
    if review.valid?
      flash[:success] = "Thank you for reviewing this recipe"
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
    def set_user
      @user = User.find(current_user.id)
    end
    
    # name: , summary: , description: , prep_times: , servings_made:
    def recipe_params
          # raise recipe_params.inspect

      params.require(:recipe).permit(:id, :user_id, :name, :summary, :description, 
        :prep_times, :servings_made,
        :picture, :chef_id,
        style_ids: [], 
        ingredients_attributes: [:id, :name, :_destroy], 
        directions_attributes: [:id, :name, :step, :_destroy], 
        feed_ids: [], 
        calorie_ids: [], 
        preptime_ids: [])
    end
    
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    
    def require_same_user
      if current_user == @recipe.user_id then
          flash[:danger] = "You can only edit your own recipes"
        redirect_to recipes_path
      end
    end

    
    def admin_user
      redirect_to recipes_path unless current_user.admin?
    end
  
end