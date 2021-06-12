class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.datetime :deleted_at
      t.bigint :post_id

      t.index :deleted_at
      t.timestamps
    end
  end
end
