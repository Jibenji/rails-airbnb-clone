class ChangeColumnNameTypeArtworks < ActiveRecord::Migration[5.0]
  def change
    rename_column :artworks, :type, :art_category
  end
end
