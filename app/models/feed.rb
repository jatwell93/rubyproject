class Feed < ActiveRecord::Base
    validates :people, presence: true
    has_many :recipe_feeds
    has_many :feeds, through: :recipe_feeds
end