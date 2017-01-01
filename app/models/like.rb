class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :recipe
    belongs_to :workout
    
    validates_uniqueness_of :user, scope: [:recipe, :workout]
end