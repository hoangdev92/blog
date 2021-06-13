class UserFriend < ApplicationRecord
  with_options class_name: User.to_s do
    belongs_to :user
    belongs_to :friend_user
  end

  enum status: { pending: 0, active: 1 }
end
