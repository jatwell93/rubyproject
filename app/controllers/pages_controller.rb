class PagesController < ApplicationController
  
  def home
    redirect_to recipes_path if logged_in?
    #not sure if this is what we want anymore in-terms of user experience - Josh 
  end
  
  def about 
  end
  
  def faq
  end
  
  
end