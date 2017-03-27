class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :address
      t.string :city
      t.string :bio
      t.string :description
      t.string :alias
      t.integer :bank_account
      t.string :picture_avatar
      t.string :picture_artist_banner
      t.boolean :artist

      t.timestamps
    end
  end
end
