class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :artwork
end
