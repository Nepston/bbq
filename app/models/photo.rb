class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, presence: true
  validates :user, presence: true

  mount_uploader :photo, PhotoUploader
end
