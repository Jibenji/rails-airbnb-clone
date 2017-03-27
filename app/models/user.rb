class User < ApplicationRecord
  belongs_to :account
  has_many :artworks, dependent: :destroy
  has_many :purchases, dependent: :destroy
end
