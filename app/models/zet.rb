class Zet < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
  
  validates :quantity, presence: true
end
