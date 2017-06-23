class Movement < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
  validates :name, presence: true
end
