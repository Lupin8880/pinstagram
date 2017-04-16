class Picture < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  validates :title, presence: true
  validates :content, presence: true

  belongs_to :user
end
