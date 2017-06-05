class IngredientsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index, :like, :search]
    before_action :require_user, except: [:show]
   
   def show
   @ingredient = Ingredient.find(params[:id])
    @ingredients = Ingredient.all
   end
   
   def new
    @ingredient = Ingredient.new
   end
   
   def create
       @ingredient = Ingredient.new(ing_parms)
       if @ingredient.save
          flash[:success] = "Ingredient was created successfully"
          redirect_to recipes_path 
       else
           render 'new'
       end
   end
   
   private 
   
   def ing_parms
      params.require(:ingredient).permit(:name) 
   end
end