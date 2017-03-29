class RemovephotoFromArtwork < ActiveRecord::Migration[5.0]
  def change
    remove_column :artworks, :picture_artwork
  end
end
