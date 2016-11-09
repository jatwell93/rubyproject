class Exercise < ActiveRecord::Base
  belongs_to :user
  
  has_many :movements
  has_many :reps
  has_many :zets
  has_many :weights  
  
  accepts_nested_attributes_for :movements,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :reps,
  															reject_if: proc { |attributes| attributes['amount'].blank? },
  															allow_destroy: true
  accepts_nested_attributes_for :zets,
  															reject_if: proc { |attributes| attributes['quantity'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :weights,
  															reject_if: proc { |attributes| attributes['kilogram'].blank? },
  															allow_destroy: true

  validates :duration_in_min, presence: true
  validates :duration_in_min, numericality: {only_integer: true}
  validates :workout, presence: true
  validates :workout_date, presence: true
  validates :movements, presence: true
  validates :reps, presence: true
  validates :zets, presence: true
  validates :weights, presence: true
  
end
