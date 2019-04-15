class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :vkontakte]

  has_many :events
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  before_validation :downcase_email, on: %i[create update]

  validates :name, presence: true, length: {maximum: 35}

  validates :email, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_validation :set_name, on: :create

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_for_facebook_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    create_user(access_token, "Facebook")
  end

  def self.find_for_vkontakte_oauth(access_token)
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    create_user(access_token, "Vkontakte")
  end

  private

  def set_name
    self.name = "Пользователь №#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
        .update_all(user_id: self.id, user_name: self.name)
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def self.create_user(access_token, network)
    provider = access_token.provider
    if network == 'Facebook'
      id = access_token.extra.raw_info.id
      url = "https://facebook.com/#{id}"
    else
      url = access_token.info.urls[network]
    end

    where(url: url, provider: provider).first_or_create! do |user|
      user.name = access_token.info.name
      if network == 'Facebook'
        user.remote_avatar_url = access_token.info.image
      else
        user.remote_avatar_url = access_token.extra.raw_info.photo_200
      end
      user.email = access_token.info.email
      user.password = Devise.friendly_token.first(16)
    end
  end
end
