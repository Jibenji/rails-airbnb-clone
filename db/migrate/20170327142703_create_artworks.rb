class CreateArtworks < ActiveRecord::Migration[5.0]
  def change
    create_table :artworks do |t|
      t.string :type
      t.string :description
      t.integer :size
      t.string :material_description
      t.references :user, foreign_key: true
      t.string :picture_artwork
      t.boolean :framed

      t.timestamps
    end
  end
end
