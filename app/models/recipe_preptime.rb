class RecipePreptime < ActiveRecord::Base
   belongs_to :recipe
   belongs_to :preptime
end