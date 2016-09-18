class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe
  validates :body, presence: true, length: { minimum: 5, maximum: 1000 }
end
