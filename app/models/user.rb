class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  # validates_presence_of :identifier, :name, :address
  # validates_uniqueness_of :identifier

  has_many :renting, class_name: :Renting, foreign_key: :user_id
  has_many :cards

  # Add this method to create a user using the omniauth data
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name   # assuming the user model has a name
      # If you have other attributes to store from the OAuth provider, you can set them here
    end
  end
end
