class AddPhotoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo_avatar, :string
    add_column :users, :photo_artists_banner, :string
  end
end
