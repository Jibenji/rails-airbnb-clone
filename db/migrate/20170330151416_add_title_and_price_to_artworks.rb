class AddTitleAndPriceToArtworks < ActiveRecord::Migration[5.0]
  def change
    add_column :artworks, :title, :string
  end
end
