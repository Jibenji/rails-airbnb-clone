class AddArtistToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :artist, :boolean
  end
end
