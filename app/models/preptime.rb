class Preptime < ActiveRecord::Base
    validates :time, presence: true
    has_many :recipe_preptimes
    has_many :preptimes, through: :recipe_preptimes
end