class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.date :date
      t.references :user, foreign_key: true
      t.references :artwork, foreign_key: true

      t.timestamps
    end
  end
end
