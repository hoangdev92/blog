class AddcolumnTopost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image_title, :string
    add_column :posts, :view, :bigint
    add_column :posts, :like, :bigint
  end
end
