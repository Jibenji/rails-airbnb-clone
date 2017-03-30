class ChangeDefaultSoldToFalse < ActiveRecord::Migration[5.0]
  def change
    change_column :artworks, :sold, :boolean, default: false
  end
end
