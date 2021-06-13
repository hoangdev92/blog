class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable , omniauth_providers: [:facebook, :google_oauth2]

  has_many :posts
  has_many :user_friends, class_name: UserFriend.to_s, foreign_key: 'user_id'
  has_many :friends, class_name: User.to_s, through: :user_friends

  has_many :friend_users, class_name: UserFriend.to_s, foreign_key: 'fiend_id'


  def self.from_omniauth(auth)
    result = User.where(email: auth.info.email).first
    if result
      return result
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth.info.name
        user.avatar = auth.info.image
        user.uid = auth.uid
        user.provider = auth.provider

        #  If you are using confirmable and the provider(s) you use validate emails
        user.skip_confirmation!
      end
    end
  end
end
