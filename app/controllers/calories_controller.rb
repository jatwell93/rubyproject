class CaloriesController < ApplicationController
   
   def new
       @calorie = Calorie.new
   end
   
   def create
      @calorie = Calorie.new(calorie_params)
      if @calorie.save
         flash[:success] = "calorie was added successfully"
         redirect_to recipes_path
      else
         render 'new'
      end
   end
   
   
   private 
   
   def calorie_params
      params.require(:calorie).permit(:amount)
   end
    
end