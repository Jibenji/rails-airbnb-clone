class Artwork < ApplicationRecord
  belongs_to :user
  validates :type, presence: true
  validates :description, presence: true
  validates :size, presence: true
  validates :material_description, presence: true
  validates :picture_artwork, presence: true
  validates :framed, inclusion: { in: [ true, false ] }
end
