class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :linkedin]       
  
  acts_as_messageable
 
  has_many  :exercises
  has_many  :workouts
  has_many  :recipes 
  has_many  :likes
  has_many  :reviews 
  has_many  :friendships
  has_many  :friends, through: :friendships, class_name: "User"
  has_many :identities, dependent: :destroy
    
  self.per_page = 10
  
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  
  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          username: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation! if user.respond_to?(:skip_confirmation)

        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.provider = auth.provider 
  #     user.uid      = auth.uid
  #     user.username = auth.info.nickname
  #     user.save
  #   end
  # end
  
  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"], without_protection: true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   else
  #     super
  #   end
  # end
  
  # def password_required?
  #   super && provider.blank?
  # end
  
  # def update_with_password(params, *options)
  #   if encrypted_password.blank?
  #     update_attributes(params, *options)
  #   else
  #     super
  #   end
  # end

  # def create
  #       user = User.from_omniauth(env["omniauth.auth"])
  #       session[:user_id] = user.id 
  #       session[:user_name] = user.name

  #     redirect_to root_path
  # end

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def mailboxer_username
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
  
  def self.search_by_name(name)
    names_array = name.split(" ")
    
    if names_array.size == 1
      where("first_name LIKE ? or last_name LIKE ?",
        "%#{names_array[0]}%", "%#{names_array[0]}%" ).order(:first_name)
    else
      where("first_name LIKE ? or first_name LIKE ? or last_name LIKE ? or last_name LIKE ?",
        "%#{names_array[0]}%", "%#{names_array[1]}%","%#{names_array[0]}%", "%#{names_array[1]}%" ).order(:first_name)
    end
  end
  
  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end
  
  def current_friendship(friend)
    friendships.where(friend: friend).first
  end
  
end
