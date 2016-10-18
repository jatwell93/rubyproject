class UsersController < ApplicationController 
   before_action :set_chef, only: [:edit, :update, :show]
   before_action :require_same_user, only: [:edit, :update]
   
   
   def index
        @users = User.paginate(page: params[:page], per_page: 3)
   end
   
   def show
        @recipes = @user.recipes.paginate(page: params[:page], per_page: 3)
   end
   
   private
   
    def set_chef
        @user = User.find(params[:id])    
    end
end