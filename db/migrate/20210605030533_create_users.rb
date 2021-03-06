class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.string :avatar
      t.string :password
      t.string :phone
      t.string :country

      t.timestamps
    end
  end
end
