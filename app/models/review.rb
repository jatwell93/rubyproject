class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
end
