class RecipeCalorie < ActiveRecord::Base
   belongs_to :recipe
   belongs_to :calorie
end