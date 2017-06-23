class Rep < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
  validates :amount, presence: true
end
