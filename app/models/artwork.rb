class Artwork < ApplicationRecord
  mount_uploader :photo_artwork, PhotoUploader
  belongs_to :user
  has_one :purchase, dependent: :destroy
  validates :art_category, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :material_description, presence: true
  validates :photo_artwork, presence: true
  validates :framed, inclusion: { in: [ true, false ] }
  validates :price, presence: true
  # validates :price, numericality: { only_integer: true }
end
