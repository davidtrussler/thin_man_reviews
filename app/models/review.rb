class Review < ApplicationRecord
  has_one_attached :thumbnail_image
  has_one_attached :main_image
end
