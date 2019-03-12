class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :downcase_email, on: %i[create update]

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_name, presence: true, unless: -> { user.present? }

  validates :user_email, presence: true,
                         format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                         uniqueness: {scope: :event_id},
                         unless: -> { user.present? }
  validate :check_mail_registered, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def downcase_email
    self.user_email = user_email.downcase if user_email.present?
  end

  def check_mail_registered
    errors.add(:user_email, :not_available) if User.find_by(email: user_email)
  end
end
