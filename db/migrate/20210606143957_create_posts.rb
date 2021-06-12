class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.datetime :time_edit
      t.datetime :deleted_at

      t.index :deleted_at
      t.timestamps
    end
  end
end
