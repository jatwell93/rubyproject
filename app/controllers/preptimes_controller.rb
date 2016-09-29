class PreptimesController < ApplicationController
   
   def new
       @preptime = Preptime.new
   end
   
   def create
      @preptime = Preptime.new(preptime_params)
      if @preptime.save
         flash[:success] = "preptime was added successfully"
         redirect_to recipes_path
      else
         render 'new'
      end
   end
   
   
   private 
   
   def preptime_params
      params.require(:preptime).permit(:time)
   end    
end