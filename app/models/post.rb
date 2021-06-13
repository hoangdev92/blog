class Post < ApplicationRecord
  mount_uploader :image_title, PostImageUploader
  acts_as_paranoid
  belongs_to :user
  has_many :attachments
  accepts_nested_attributes_for :attachments
end
