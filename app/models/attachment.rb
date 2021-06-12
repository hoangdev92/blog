class Attachment < ApplicationRecord
  mount_uploaders :name, AttachmentUploader
  acts_as_paranoid
  belongs_to :post
end
