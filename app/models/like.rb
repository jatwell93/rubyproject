class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :recipe
    
    validates_uniqueness_of :user, scope: :recipe 
end