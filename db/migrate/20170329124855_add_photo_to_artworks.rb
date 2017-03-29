class AddPhotoToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :photo_artwork, :string
  end
end
