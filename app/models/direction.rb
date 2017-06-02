class Direction < ActiveRecord::Base
  belongs_to :recipe

  validates :name, presence: true, length: { minimum: 5, maximum: 100}
end
