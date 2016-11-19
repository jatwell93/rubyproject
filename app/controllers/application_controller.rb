class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
    
  helper_method  :logged_in?
  helper_method :mailbox, :conversation

  private
 
    def mailbox
      @mailbox ||= current_user.mailbox
    end
  
    def conversation
     @conversation ||= mailbox.conversations.find(params[:id])
    end

  
    def logged_in?
      !!current_user
    end
    
    def require_user
      if !logged_in?
        flash[:danger] = "You must be logged in to perform that aciton"
        redirect_to recipes_path
      end
    end
    
end

