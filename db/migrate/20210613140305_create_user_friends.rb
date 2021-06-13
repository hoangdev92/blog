class CreateUserFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :user_friends do |t|
      t.bigint :user_id
      t.bigint :fiend_id
      t.integer :status
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
