class UserRecipe < ActiveRecord::Base
  belongs_to :users
  belongs_to :recipe
end
