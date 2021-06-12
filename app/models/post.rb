class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  has_many :attachments
  accepts_nested_attributes_for :attachments
end
