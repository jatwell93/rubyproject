class Calorie < ActiveRecord::Base
    validates :amount, presence: true
    has_many :recipe_calories
    has_many :calories, through: :recipe_calories
end