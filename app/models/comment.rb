class Comment < ActiveRecord::Base
  has_many :comments, -> { order('created_at DESC') } ,{as: :commentable, dependent: :destroy}
end

