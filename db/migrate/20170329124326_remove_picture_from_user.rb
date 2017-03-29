class RemovephotoFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :picture_avatar
    remove_column :users, :picture_artist_banner
  end
end
