class ChangeArtworksSizeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :artworks, :size, :string
  end
end
