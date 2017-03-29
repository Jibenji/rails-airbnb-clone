class Artwork < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :art_category, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :material_description, presence: true
  validates :photo_artwork, presence: true
  validates :framed, inclusion: { in: [ true, false ] }
end
