class User < ApplicationRecord
  # include PgSearch
  mount_uploader :photo_avatar, PhotoUploader
  mount_uploader :photo_artists_banner, PhotoUploader
  belongs_to :account
  has_many :artworks, dependent: :destroy
  has_many :purchases, dependent: :destroy

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :photo_avatar, presence: true, on: :update
  # validates :alias, uniqueness: true, on: :update
  # validates :address, presence: true, if: :artist
  validates :photo_artists_banner, presence: true, on: :update
  # validates :bank_account, uniqueness: true, presence: true
  # validates :bio, presence: true
  # validates :description, presence: true


  def artist?
  end

  def self.search(search)
    where("first_name ILIKE ?", "%#{search}%")
  end

end
