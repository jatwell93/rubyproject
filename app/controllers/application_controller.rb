class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    
  helper_method :logged_in?
  helper_method :mailbox, :conversation
  # helper_method :current_user
  def ensure_signup_complete
    # Ensure we don't go into an infinite loop
    return if action_name == 'finish_signup'

    # Redirect to the 'finish_signup' page if the user
    # email hasn't been verified yet
    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end
  
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