class Weight < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :workout
end
