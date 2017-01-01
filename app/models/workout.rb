class Workout < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  
  has_many :movements
  has_many :reps
  has_many :zets
  has_many :weights  
  has_many :reviews
  
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
  															
  validates :name, presence: true
  validates :summary, presence: true
  validates :movements, presence: true
  validates :reps, presence: true
  validates :zets, presence: true
  validates :weights, presence: true
end
