class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
