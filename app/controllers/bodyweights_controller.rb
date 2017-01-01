class BodyweightsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_bodyweight, except: [:index, :new, :create]
    
    def index 
      @bodyweights = current_user.bodyweights.all
      @friends = current_user.friends
    end
    
    def new
       @bodyweight = current_user.bodyweights.new
    end
    
    def create
      @bodyweight = current_user.bodyweights.new(bodyweight_params)
      
      if @bodyweight.save
        flash[:success] = "Bodyweight has been created"
        redirect_to [current_user, @bodyweight]
        
      else
        flash[:warning] = "Bodyweight has not been created"
        render :new
      end
    end
    
    def show
      @bodyweights = current_user.bodyweights.all
    end
    
    def edit
      
    end
    
    def update

      if @bodyweight.update(bodyweight_params)
        flash[:success] = "Bodyweight has been updated"
        redirect_to [current_user, @bodyweight]
        
      else
        flash[:warning] = "Bodyweight has not been updated"
        render :edit
      end
    end
    
    def destroy
      @bodyweight.destroy
      flash[:success] = "Bodyweight has been deleted"
      redirect_to user_bodyweights_path(current_user)
    end
    
    private
      
      def bodyweight_params
        params.require(:bodyweight).permit(:body_weight, :height, :bmi)
      end
      
      def set_bodyweight
        @bodyweight = current_user.bodyweights.find(params[:id])
      end
end
