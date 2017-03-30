class AddSoldToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :sold, :boolean
  end
end
