class RecipeFeed < ActiveRecord::Base
   belongs_to :recipe
   belongs_to :feed
end