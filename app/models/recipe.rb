class Recipe < ActiveRecord::Base
    belongs_to  :user
    has_many    :likes, dependent: :destroy 
    has_many    :recipe_styles, dependent: :destroy
    has_many    :styles, through: :recipe_styles
    has_many    :ingredients
    has_many    :directions
    has_many    :reviews 
    has_many    :recipe_calories
    has_many    :comments, as: :commentable
    has_many    :calories, through: :recipe_calories
    has_many    :recipe_preptimes
    has_many    :preptimes, through: :recipe_preptimes
    has_many    :recipe_feeds
    has_many    :feeds, through: :recipe_feeds
    # searchkick
    accepts_nested_attributes_for :ingredients,
  															reject_if: proc { |attributes| attributes['name'].blank? },
  															allow_destroy: true
 	accepts_nested_attributes_for :directions,
  															reject_if: proc { |attributes| attributes['step'].blank? },
  															allow_destroy: true

    validates :directions, presence: true
    validates :ingredients, presence: true
    # validates :user_id, presence: true
    validates :name, presence: true, length: { minimum: 5, maximum: 100}
    validates :summary, presence: true, length: { minimum: 10, maximum: 150}
    validates :description, presence: true, length: { minimum: 5, maximum: 1000}
    mount_uploader :picture, PictureUploader
    validate :picture_size 
    
    def thumbs_up_total
       self.likes.where(like: true).size 
    end
    
    def thumbs_down_total
        self.likes.where(like: false).size
    end
    
    private 
        def picture_size
           if picture.size > 5.megabytes
               errors.add(:picture, "should be less than 5MB")
           end
        end
end