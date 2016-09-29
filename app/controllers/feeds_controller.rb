class FeedsController < ApplicationController
   
   def new
       @feed = Feed.new
   end
   
   def create
      @feed = Feed.new(feed_params)
      if @feed.save
         flash[:success] = "feed was added successfully"
         redirect_to recipes_path
      else
         render 'new'
      end
   end
   
   
   private 
   
   def feed_params
      params.require(:feed).permit(:people)
   end
end